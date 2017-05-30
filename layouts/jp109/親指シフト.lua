-- Oyayubi Shifuto
local assert = require "lib.assert"
local layout = require "lib.layout"

return layout.new {
  name = "親指シフト",
  build = function (model, keytable, options)
    local K = model:map_to_key()
    local C = model:map_to_char()

    -- options
    local left_thumb_key_list = keytable:map(options.left_thumb_key or "Space")
    local left_thumb_key_role = options.left_thumb_key_role or KeyRole.TRIGGER
    local right_thumb_key_list = keytable:map(options.right_thumb_key or "Convert")
    local right_thumb_key_role = options.right_thumb_key_role or KeyRole.TRIGGER
    local left_thumb_command = model:map_to_key(options.left_thumb_command or {"Space"})
    local right_thumb_command = model:map_to_key(options.right_thumb_command or {"Convert"})

    -- commands
    local alphanumeric_commands = model:map_to_keys {
      {"1"}, {"2"}, {"3"}, {"4"}, {"5"}, {"6"}, {"7"}, {"8"}, {"9"}, {"0"}, {"-"}, {"^"}, {"\\|"},
      {"q"}, {"w"}, {"e"}, {"r"}, {"t"}, {"y"}, {"u"}, {"i"}, {"o"}, {"p"}, {"@"}, {"["},
      {"a"}, {"s"}, {"d"}, {"f"}, {"g"}, {"h"}, {"j"}, {"k"}, {"l"}, {";"}, {":"}, {"]"},
      {"z"}, {"x"}, {"c"}, {"v"}, {"b"}, {"n"}, {"m"}, {","}, {"."}, {"/"}, {"\\_"},
    }
    local alphanumeric_shift_commands = model:map_to_keys {
      {"!"}, {"\""}, {"#"}, {"$"}, {"%"}, {"&"}, {"'"}, {"("}, {")"}, {"Shift+0"}, {"="}, {"~"}, {"|"},
      {"Q"}, {"W"}, {"E"}, {"R"}, {"T"}, {"Y"}, {"U"}, {"I"}, {"O"}, {"P"}, {"`"}, {"{"},
      {"A"}, {"S"}, {"D"}, {"F"}, {"G"}, {"H"}, {"J"}, {"K"}, {"L"}, {"+"}, {"*"}, {"}"},
      {"Z"}, {"X"}, {"C"}, {"V"}, {"B"}, {"N"}, {"M"}, {"<"}, {">"}, {"?"}, {"_"},
    }
    local no_thumb_commands = model:map_to_keys {
      {"1"}, {"2"}, {"3"}, {"4"}, {"5"}, {"6"}, {"7"}, {"8"}, {"9"}, {"0"}, {"-"}, {"^"}, {"\\"},
      {"。"}, {"か"}, {"た"}, {"こ"}, {"さ"}, {"ら"}, {"ち"}, {"く"}, {"つ"}, {"，"}, {"、"}, {"゛"},
      {"う"}, {"し"}, {"て"}, {"け"}, {"せ"}, {"は"}, {"と"}, {"き"}, {"い"}, {"ん"}, {"Backspace"}, {},
      {"．"}, {"ひ"}, {"す"}, {"ふ"}, {"へ"}, {"め"}, {"そ"}, {"ね"}, {"ほ"}, {"・"}, {},
    }
    local left_thumb_commands = model:map_to_keys {
      {"？"}, {"／"}, {"〜"}, {"「"}, {"」"}, {"［"}, {"］"}, {"（"}, {"）"}, {}, {}, {}, {},
      {"ぁ"}, {"え"}, {"り"}, {"ゃ"}, {"れ"}, {"ぱ"}, {"ぢ"}, {"ぐ"}, {"づ"}, {"ぴ"}, {}, {},
      {"を"}, {"あ"}, {"な"}, {"ゅ"}, {"も"}, {"ば"}, {"ど"}, {"ぎ"}, {"ぽ"}, {}, {}, {},
      {"ぅ"}, {"ー"}, {"ろ"}, {"や"}, {"ぃ"}, {"ぷ"}, {"ぞ"}, {"ぺ"}, {"ぼ"}, {}, {},
    }

    local right_thumb_commands = model:map_to_keys {
      {"？"}, {"／"}, {"〜"}, {"「"}, {"」"}, {"［"}, {"］"}, {"（"}, {"）"}, {}, {}, {}, {},
      {}, {"が"}, {"だ"}, {"ご"}, {"ざ"}, {"よ"}, {"に"}, {"る"}, {"ま"}, {"ぇ"}, {}, {"゜"},
      {"ヴ"}, {"じ"}, {"で"}, {"げ"}, {"ぜ"}, {"み"}, {"お"}, {"の"}, {"ょ"}, {"っ"}, {}, {},
      {}, {"び"}, {"ず"}, {"ぶ"}, {"べ"}, {"め"}, {"ゆ"}, {"む"}, {"わ"}, {"ぉ"}, {},
    }

    return {
      deferred_key_flows {
        key_lists = keytable.alphanumeric_key_lists,
      },
      deferred_key_flows {
        key_lists = {
          left_thumb_key_list,
          right_thumb_key_list,
        }
      },
      immediate_key_flows {
        key_lists = keytable.non_alphanumeric_key_lists,
      },
      immediate_key_flows {
        key_lists = keytable.modifier_key_lists,
      },
      simple_mappings {
        trigger_key_lists = keytable.alphanumeric_key_lists,
        modifier_key_lists = keytable.modifier_key_lists,
        commands = no_thumb_commands,
        shift_commands = alphanumeric_shift_commands,
        cao_commands = alphanumeric_commands,
        cao_shift_commands = alphanumeric_shift_commands,
      },
      extended_mappings {
        trigger_key_lists = keytable.alphanumeric_key_lists,
        shift_key_list = {left_thumb_key_list, left_thumb_key_role},
        commands = left_thumb_commands,
      },
      extended_mappings {
        trigger_key_lists = keytable.alphanumeric_key_lists,
        shift_key_list = {right_thumb_key_list, right_thumb_key_role},
        commands = right_thumb_commands,
      },
      simple_mappings {
        trigger_key_lists = {left_thumb_key_list, right_thumb_key_list},
        modifier_key_lists = keytable.modifier_key_lists,
        commands = {left_thumb_command, right_thumb_command},
      },
      simple_mappings {
        trigger_key_lists = keytable.non_alphanumeric_key_lists,
        modifier_key_lists = keytable.modifier_key_lists,
        commands = model.non_alphanumeric_commands,
      },
      modifiers_mappings {
        modifier_key_lists = keytable.modifier_key_lists,
      },
    }
  end
}
