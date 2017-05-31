local assert = require "lib.assert"
local layout = require "lib.layout"

return layout.new {
  name = "親指シフトSHR",
  build = function (model, keytable, options)
    local K = model:map_to_key()
    local C = model:map_to_char()

    -- options
    local left_thumb_key = keytable:map(options.left_thumb_key or "Space")
    local left_thumb_key_role = options.left_thumb_key_role or KeyRole.TRIGGER
    local left_thumb_command = model:map_to_key(options.left_thumb_command or {"Space"})
    local right_thumb_key = keytable:map(options.right_thumb_key or "Convert")
    local right_thumb_key_role = options.right_thumb_key_role or KeyRole.TRIGGER
    local right_thumb_command = model:map_to_key(options.right_thumb_command or {"Convert"})
    local left_left_thumb_key = keytable:map(options.left_left_thumb_key or "NonConvert")
    local left_left_thumb_key_role = options.left_left_thumb_key_role or KeyRole.TRIGGER
    local left_left_thumb_command = model:map_to_key(options.left_left_thumb_command or {"NonConvert"})
    local right_right_thumb_key = keytable:map(options.right_right_thumb_key or "KatakanaHiragana")
    local right_right_thumb_key_role = options.right_right_thumb_key_role or KeyRole.TRIGGER
    local right_right_thumb_command = model:map_to_key(options.right_right_thumb_command or {"KatakanaHiragana"})
    local unicode_kana = options.unicode_kana or false

    local map_to_kana = unicode_kana and model:map_to_chars() or model:map_to_keys()

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
    local no_thumb_commands = map_to_kana {
      K{"1"}, K{"2"}, K{"3"}, K{"4"}, K{"5"}, K{"6"}, K{"7"}, K{"8"}, K{"9"}, K{"0"}, K{"-"}, K{"^"}, K{"\\"},
      C{"。"}, {"か"}, {"た"}, {"こ"}, {"さ"}, {}, {"ら"}, {"ち"}, {"く"}, {"つ"}, C{"，"}, C{"、"},
      {"う"}, {"し"}, {"て"}, {"け"}, {"せ"}, {}, {"は"}, {"と"}, {"き"}, {"い"}, {"ん"}, K{"Backspace"},
      C{"．"}, {"ひ"}, {"す"}, {"ふ"}, {"へ"}, {}, {"め"}, {"そ"}, {"ね"}, {"ほ"}, C{"・"},
    }
    local left_thumb_commands = map_to_kana {
      C{"？"}, C{"／"}, C{"～"}, C{"「"}, C{"」"}, C{"［"}, C{"］"}, C{"（"}, C{"）"}, {}, {}, {}, {},
      {"ぁ"}, {"え"}, {"り"}, {"ゃ"}, {"れ"}, {}, {"ぱ"}, {"ぢ"}, {"ぐ"}, {"づ"}, {"ぴ"}, {},
      {"を"}, {"あ"}, {"な"}, {"ゅ"}, {"も"}, {}, {"ば"}, {"ど"}, {"ぎ"}, {"ぽ"}, {}, {},
      {"ぅ"}, C{"ー"}, {"ろ"}, {"や"}, {"ぃ"}, {}, {"ぷ"}, {"ぞ"}, {"ぺ"}, {"ぼ"}, {},
    }

    local right_thumb_commands = map_to_kana {
      C{"？"}, C{"／"}, C{"～"}, C{"「"}, C{"」"}, C{"［"}, C{"］"}, C{"（"}, C{"）"}, {}, {}, {}, {},
      {}, {"が"}, {"だ"}, {"ご"}, {"ざ"}, {}, {"よ"}, {"に"}, {"る"}, {"ま"}, {"ぇ"}, {},
      {"ヴ"}, {"じ"}, {"で"}, {"げ"}, {"ぜ"}, {}, {"み"}, {"お"}, {"の"}, {"ょ"}, {"っ"}, {},
      {}, {"び"}, {"ず"}, {"ぶ"}, {"べ"}, {}, {"め"}, {"ゆ"}, {"む"}, {"わ"}, {"ぉ"},
    }

    return {
      deferred_key_flows {
        key_lists = {
          keytable.alphanumeric_keys,
          {left_thumb_key, right_thumb_key},
        }
      },
      immediate_key_flows {
        key_lists = {
          keytable.non_alphanumeric_keys,
          keytable.modifier_keys,
        }
      },
      simple_mappings {
        keys = keytable.alphanumeric_keys,
        commands = no_thumb_commands,
        shift_commands = alphanumeric_shift_commands,
        cao_commands = alphanumeric_commands,
        cao_shift_commands = alphanumeric_shift_commands,
      },
      extended_mappings {
        keys = keytable.alphanumeric_keys,
        shift_keys = {{left_thumb_key, left_thumb_key_role}},
        commands = left_thumb_commands,
      },
      extended_mappings {
        keys = keytable.alphanumeric_keys,
      shift_keys = {{right_thumb_key, right_thumb_key_role}},
        commands = right_thumb_commands,
      },
      simple_mappings {
        keys = {left_thumb_key, right_thumb_key, left_left_thumb_key, right_right_thumb_key},
        commands = {left_thumb_command, right_thumb_command, left_left_thumb_command, right_right_thumb_command},
      },
      passthrough_mappings {
        keys = keytable.non_alphanumeric_keys,
      },
      modifiers_mappings {},
    }
  end
}
