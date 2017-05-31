-- 蜂蜜小梅SHR
local assert = require "lib.assert"
local layout = require "lib.layout"
local shr = require "layouts.jp109.SHR"

return layout.new {
  name = "蜂蜜小梅SHR",
  build = function (model, keytable, options)
    local K = model:map_to_key()
    local C = model:map_to_char()

    -- options
    local left_thumb_key_list = keytable:map(options.left_thumb_key or "Space")
    local left_thumb_key_role = options.left_thumb_key_role or KeyRole.TRIGGER
    local left_thumb_command = model:map_to_key(options.left_thumb_command or {"Space"})
    local right_thumb_key_list = keytable:map(options.right_thumb_key or "Convert")
    local right_thumb_key_role = options.right_thumb_key_role or KeyRole.TRIGGER
    local right_thumb_command = model:map_to_key(options.right_thumb_command or {"Convert"})
    local left_left_thumb_key_list = keytable:map(options.left_left_thumb_key or "NonConvert")
    local left_left_thumb_key_role = options.left_left_thumb_key_role or KeyRole.TRIGGER
    local left_left_thumb_command = model:map_to_key(options.left_left_thumb_command or {"NonConvert"})
    local right_right_thumb_key_list = keytable:map(options.right_right_thumb_key or "KatakanaHiragana")
    local right_right_thumb_key_role = options.right_right_thumb_key_role or KeyRole.TRIGGER
    local right_right_thumb_command = model:map_to_key(options.right_right_thumb_command or {"KatakanaHiragana"})

    -- keys
    local wo_key_lists = keytable:map {
      "D", "L",
    }
    local yoon_key_lists = keytable:map {
      "Q", "W", "E", "R", "T",
      "A", "S", "D", "F", "G",
      "Z", "X", "C", "V", "B",
    }
    local dake_assistance_key_lists = keytable:map {
      "W", "E",
    }
    local demo_assistance_key_lists = keytable:map {
      "S", "D",
    }
    local mase_assistance_key_lists = keytable:map {
      "D", "F",
    }
    local made_assistance_key_lists = keytable:map {
      "X", "C",
    }
    local iki_assistance_key_lists = keytable:map {
      "O", "P",
    }
    local kure_assistance_key_lists = keytable:map {
      "K", "L",
    }
    local ari_assistance_key_lists = keytable:map {
      "L", ";+",
    }
    local ichi_assistance_key_lists = keytable:map {
      ".>", "/?",
    }

    -- commands
    local no_thumb_commands = model:map_to_keys {
      K{"1"}, K{"2"}, K{"3"}, K{"4"}, K{"5"}, K{"6"}, K{"7"}, K{"8"}, K{"9"}, K{"0"}, K{"-"}, K{"^"}, K{"\\"},
      {"。"}, {"な"}, {"て"}, {"せ"}, {"そ"}, {}, {"・"}, {"お"}, {"の"}, {"に"}, {"「", "」"}, {"、"},
      {"こ"}, {"た"}, {"か"}, {"る"}, {"は"}, {}, {"ー"}, {"ん"}, {"い"}, {"し"}, {"と"}, K{"Backspace"},
      {"ゆ"}, {"ほ"}, {"ま"}, {"ろ"}, {"〜"}, {}, {"っ"}, {"う"}, {"す"}, {"ら"}, {"へ"},
    }
    local left_thumb_commands = model:map_to_keys {
      {"？"}, {"／"}, {"〜"}, {"「"}, {"」"}, {"［"}, {"］"}, {"（"}, {"）"}, {}, {}, {}, {},
      {"ぺ"}, {"け"}, {"よ"}, {"―"}, {"…"}, {}, {"ゑ"}, {"び"}, {"ぎ"}, {"づ"}, {"」"}, {"゛"},
      {"め"}, {"や"}, {"も"}, {"さ"}, {"ぅ"}, {}, {"ぃ"}, {"ぁ"}, {"ぐ"}, {"じ"}, {"ど"}, {"ぴ"},
      {"ゅ"}, {"ゃ"}, {"ふ"}, {"ょ"}, {"ぉ"}, {}, {"ぇ"}, {"ヴ"}, {"ず"}, {"ぢ"}, {"べ"},
    }

    local right_thumb_commands = model:map_to_keys {
      {"？"}, {"／"}, {"〜"}, {"「"}, {"」"}, {"［"}, {"］"}, {"（"}, {"）"}, {}, {}, {}, {},
      {"ぱ"}, {"げ"}, {"で"}, {"ぜ"}, {"ぞ"}, {}, {"ゐ"}, {"ひ"}, {"き"}, {"つ"}, {"」"}, {"（", "）"},
      {"ご"}, {"だ"}, {"が"}, {"ざ"}, {"ば"}, {}, {"む"}, {"れ"}, {"く"}, {"り"}, {"わ"}, {"ね"},
      {"ぽ"}, {"ぼ"}, {"ぶ"}, {"ぷ"}, {"ゎ"}, {}, {"み"}, {"あ"}, {"え"}, {"ち"}, {"ぬ"},
    }
    local y_yoon_commands = model:map_to_keys {
      {}, {}, {}, {}, {},
      {}, {"ゅ"}, {"ょ"}, {"ゃ"}, {},
      {}, {}, {}, {}, {},
    }
    local u_yoon_commands = model:map_to_keys {
      {"ひぇ"}, {"ひゅ"}, {"ひょ"}, {"ひゃ"}, {"ひぃ"},
      {}, {}, {}, {}, {},
      {"びぇ"}, {"びゅ"}, {"びょ"}, {"びゃ"}, {"びぃ"},
    }
    local i_yoon_commands = model:map_to_keys {
      {"きぇ"}, {"きゅ"}, {"きょ"}, {"きゃ"}, {"きぃ"},
      {}, {}, {}, {}, {},
      {"ぎぇ"}, {"ぎゅ"}, {"ぎょ"}, {"ぎゃ"}, {"ぎぃ"},
    }
    local o_yoon_commands = model:map_to_keys {
      {"つぇ"}, {}, {"つぉ"}, {"つぁ"}, {"つぃ"},
      {"にぇ"}, {"にゅ"}, {"にょ"}, {"にゃ"}, {"にぃ"},
      {"づぇ"}, {}, {"づぉ"}, {"づぁ"}, {"づぃ"},
    }
    local j_yoon_commands = model:map_to_keys {
      {}, {}, {}, {}, {},
      {"ふぇ"}, {"ふぅ"}, {"ふぉ"}, {"ふぁ"}, {"ふぃ"},
      {"ぶぇ"}, {"ぶぅ"}, {"ぶぉ"}, {"ぶぁ"}, {"ぶぃ"},
    }
    local k_yoon_commands = model:map_to_keys {
      {"くぇ"}, {"くゎ"}, {"くぉ"}, {"くぁ"}, {"くぃ"},
      {"いぇ"}, {}, {}, {}, {},
      {"ぐぇ"}, {"ぐゎ"}, {"ぐぉ"}, {"ぐぁ"}, {"ぐぃ"},
    }
    local l_yoon_commands = model:map_to_keys {
      {"りぇ"}, {"りゅ"}, {"りょ"}, {"りゃ"}, {"りぃ"},
      {"しぇ"}, {"しゅ"}, {"しょ"}, {"しゃ"}, {"しぃ"},
      {"じぇ"}, {"じゅ"}, {"じょ"}, {"じゃ"}, {"じぃ"},
    }
    local semicolon_yoon_commands = model:map_to_keys {
      {"ゑ"}, {}, {}, {"ゎ"}, {"ゐ"},
      {}, {"とぅ"}, {}, {}, {},
      {}, {"どぅ"}, {}, {}, {},
    }
    local colon_yoon_commands = model:map_to_keys {
      {}, {}, {}, {}, {},
      {"ぺ"}, {"ぷ"}, {"ぽ"}, {"ぱ"}, {"ぴ"},
      {"ぴぇ"}, {"ぴゅ"}, {"ぴょ"}, {"ぴゃ"}, {"ぴぃ"},
    }
    local n_yoon_commands = model:map_to_keys {
      {"みぇ"}, {"みゅ"}, {"みょ"}, {"みゃ"}, {"みぃ"},
      {}, {}, {}, {}, {},
      {}, {}, {}, {}, {},
    }
    local m_yoon_commands = model:map_to_keys {
      {"ぇ"}, {"ぅ"}, {"ぉ"}, {"ぁ"}, {"ぃ"},
      {"うぇ"}, {}, {"うぉ"}, {}, {"うぃ"},
      {"ヴぇ"}, {"ヴゅ"}, {"ヴぉ"}, {"ヴぁ"}, {"ヴぃ"},
    }
    local comma_yoon_commands = model:map_to_keys {
      {}, {}, {}, {}, {},
      {}, {"てゅ"}, {}, {}, {"てぃ"},
      {}, {"でゅ"}, {}, {}, {"でぃ"},
    }
    local period_yoon_commands = model:map_to_keys {
      {"ちぇ"}, {"ちゅ"}, {"ちょ"}, {"ちゃ"}, {"ちぃ"},
      {}, {}, {}, {}, {},
      {"ぢぇ"}, {"ぢゅ"}, {"ぢょ"}, {"ぢゃ"}, {"ぢぃ"},
    }
    local slash_yoon_commands = model:map_to_keys {
      {}, {}, {"ぬぉ"}, {}, {},
      {}, {}, {}, {}, {},
      {}, {}, {}, {}, {},
    }

    local cao_alphanumeric_commands = nil
    local cao_alphanumeric_shift_commands = nil
    if options.cao_type == "QWERTY" then
      cao_alphanumeric_commands = model.qwerty_alphanumeric_commands
    else
      cao_alphanumeric_commands = model:map_to_keys(shr.QWERTY_COMMANDS)
      cao_alphanumeric_shift_commands = model:map_to_keys(shr.QWERTY_SHIFT_COMMANDS)
    end

    return {
      -- deferred_key_flows {
      --   key_lists = keytable.alphanumeric_key_lists,
      -- },
      -- deferred_key_flows {
      --   key_lists = {
      --     left_thumb_key_list,
      --     right_thumb_key_list,
      --   }
      -- },
      simul_key_flows {
        key_lists = keytable.alphanumeric_key_lists,
      },
      simul_key_flows {
        key_lists = {
          left_thumb_key_list,
          right_thumb_key_list,
        }
      },
      immediate_key_flows {
        key_lists = {
          left_left_thumb_key_list,
          right_right_thumb_key_list,
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
        shift_commands = model.alphanumeric_shift_commands,
        cao_commands = cao_alphanumeric_commands,
        cao_shift_commands = cao_alphanumeric_shift_commands,
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
      extended_mappings {
        trigger_key_lists = {wo_key_lists[1]},
        shift_key_list = {wo_key_lists[2], KeyRole.TRIGGER},
        commands = {K{"を"}},
      },
      extended_mappings {
        trigger_key_lists = yoon_key_lists,
        shift_key_list = {keytable:map("U"), KeyRole.TRIGGER},
        commands = y_yoon_commands,
      },
      extended_mappings {
        trigger_key_lists = yoon_key_lists,
        shift_key_list = {keytable:map("I"), KeyRole.TRIGGER},
        commands = u_yoon_commands,
      },
      extended_mappings {
        trigger_key_lists = yoon_key_lists,
        shift_key_list = {keytable:map("O"), KeyRole.TRIGGER},
        commands = i_yoon_commands,
      },
      extended_mappings {
        trigger_key_lists = yoon_key_lists,
        shift_key_list = {keytable:map("P"), KeyRole.TRIGGER},
        commands = o_yoon_commands,
      },
      extended_mappings {
        trigger_key_lists = yoon_key_lists,
        shift_key_list = {keytable:map("K"), KeyRole.TRIGGER},
        commands = j_yoon_commands,
      },
      extended_mappings {
        trigger_key_lists = yoon_key_lists,
        shift_key_list = {keytable:map("L"), KeyRole.TRIGGER},
        commands = k_yoon_commands,
      },
      extended_mappings {
        trigger_key_lists = yoon_key_lists,
        shift_key_list = {keytable:map(";+"), KeyRole.TRIGGER},
        commands = l_yoon_commands,
      },
      extended_mappings {
        trigger_key_lists = yoon_key_lists,
        shift_key_list = {keytable:map(":*"), KeyRole.TRIGGER},
        commands = semicolon_yoon_commands,
      },
      extended_mappings {
        trigger_key_lists = yoon_key_lists,
        shift_key_list = {keytable:map("]}"), KeyRole.TRIGGER},
        commands = colon_yoon_commands,
      },
      extended_mappings {
        trigger_key_lists = yoon_key_lists,
        shift_key_list = {keytable:map("M"), KeyRole.TRIGGER},
        commands = n_yoon_commands,
      },
      extended_mappings {
        trigger_key_lists = yoon_key_lists,
        shift_key_list = {keytable:map(",<"), KeyRole.TRIGGER},
        commands = m_yoon_commands,
      },
      extended_mappings {
        trigger_key_lists = yoon_key_lists,
        shift_key_list = {keytable:map(".>"), KeyRole.TRIGGER},
        commands = comma_yoon_commands,
      },
      extended_mappings {
        trigger_key_lists = yoon_key_lists,
        shift_key_list = {keytable:map("/?"), KeyRole.TRIGGER},
        commands = period_yoon_commands,
      },
      extended_mappings {
        trigger_key_lists = yoon_key_lists,
        shift_key_list = {keytable:map("\\_"), KeyRole.TRIGGER},
        commands = slash_yoon_commands,
      },
      simple_mappings {
        trigger_key_lists = {left_thumb_key_list, right_thumb_key_list, left_left_thumb_key_list, right_right_thumb_key_list},
        modifier_key_lists = keytable.modifier_key_lists,
        commands = {left_thumb_command, right_thumb_command, left_left_thumb_command, right_right_thumb_command},
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
