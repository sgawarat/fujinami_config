-- ColemakSHR
local assert = require "lib.assert"
local inspect = require "lib.inspect"
local layout = require "lib.layout"
local shr = require "layouts.jp109.SHR"

return layout.new {
  name = "ColemakSHR",
  build = function (model, keytable, options)
    local K = model:map_to_key()
    local C = model:map_to_char()

    local left_thumb_key_list = keytable:map(options.left_thumb_key or "Space")
    local left_thumb_key_role = options.left_thumb_key_role or KeyRole.TRIGGER
    local left_thumb_key_command = model:map_to_key(options.left_thumb_key_command or {"Space"})
    local right_thumb_key_list = keytable:map(options.right_thumb_key or "Convert")
    local right_thumb_key_role = options.right_thumb_key_role or KeyRole.TRIGGER
    local right_thumb_key_command = model:map_to_key(options.right_thumb_key_command or {"Convert"})
    local left_left_thumb_key_list = keytable:map(options.left_thumb_key or "NonConvert")
    local left_left_thumb_key_role = options.left_thumb_key_role or KeyRole.MODIFIER
    local left_left_thumb_key_command = model:map_to_key(options.left_thumb_key_command or {{0}})
    local right_right_thumb_key_list = keytable:map(options.right_right_thumb_key or "KatakanaHiragana")
    local right_right_thumb_key_role = options.right_right_thumb_key_role or KeyRole.TRIGGER
    local right_right_thumb_key_command = model:map_to_key(options.right_right_thumb_key_command or {"KatakanaHiragana"})

    local colemak_alphanumeric_commands = model:map_to_keys(shr.COLEMAK_COMMANDS)
    local colemak_alphanumeric_shift_commands = model:map_to_keys(shr.COLEMAK_SHIFT_COMMANDS)
    local qwerty_alphanumeric_commands = model:map_to_keys {
      {"1"}, {"2"}, {"3"}, {"4"}, {"5"}, {"6"}, {"7"}, {"8"}, {"9"}, {"0"}, {"-"}, {"^"}, {"\\|"},
      {"q"}, {"w"}, {"e"}, {"r"}, {"t"}, {"y"}, {"u"}, {"i"}, {"o"}, {"p"}, {"@"}, {"["},
      {"a"}, {"s"}, {"d"}, {"f"}, {"g"}, {"h"}, {"j"}, {"k"}, {"l"}, {";"}, {":"}, {"]"},
      {"z"}, {"x"}, {"c"}, {"v"}, {"b"}, {"n"}, {"m"}, {","}, {"."}, {"/"}, {"\\_"},
    }
    local qwerty_alphanumeric_shift_commands = model:map_to_keys {
      {"!"}, {"\""}, {"#"}, {"$"}, {"%"}, {"&"}, {"'"}, {"("}, {")"}, {"Shift+0"}, {"="}, {"~"}, {"|"},
      {"Q"}, {"W"}, {"E"}, {"R"}, {"T"}, {"Y"}, {"U"}, {"I"}, {"O"}, {"P"}, {"`"}, {"{"},
      {"A"}, {"S"}, {"D"}, {"F"}, {"G"}, {"H"}, {"J"}, {"K"}, {"L"}, {"+"}, {"*"}, {"}"},
      {"Z"}, {"X"}, {"C"}, {"V"}, {"B"}, {"N"}, {"M"}, {"<"}, {">"}, {"?"}, {"_"},
    }
    local left_thumb_commands = model:map_to_keys(shr.LEFT_THUMB_COMMANDS)
    local right_thumb_commands = model:map_to_keys(shr.RIGHT_THUMB_COMMANDS)
    local left_left_thumb_commands = model:map_to_keys(shr.LEFT_LEFT_THUMB_COMMANDS)
    local cao_alphanumeric_commands = nil
    local cao_alphanumeric_shift_commands = nil
    if options.cao_type == "QWERTY" then
      cao_alphanumeric_commands = qwerty_alphanumeric_commands
      cao_alphanumeric_shift_commands = qwerty_alphanumeric_shift_commands
    elseif options.cao_type == "QWERTYSHR" then
      cao_alphanumeric_commands = model:map_to_keys(shr.QWERTY_COMMANDS)
      cao_alphanumeric_shift_commands = model:map_to_keys(shr.QWERTY_SHIFT_COMMANDS)
    else
      cao_alphanumeric_commands = colemak_alphanumeric_commands
      cao_alphanumeric_shift_commands = colemak_alphanumeric_shift_commands
    end

    return {
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
        commands = colemak_alphanumeric_commands,
        shift_commands = colemak_alphanumeric_shift_commands,
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
        trigger_key_lists = keytable.alphanumeric_key_lists,
        shift_key_list = {left_left_thumb_key_list, left_left_thumb_key_role},
        modifier_key_lists = keytable.modifier_key_lists,
        commands = left_left_thumb_commands,
        shift_key_command = left_left_thumb_key_command,
      },
      simple_mappings {
        trigger_key_lists = {left_thumb_key_list, right_thumb_key_list, right_right_thumb_key_list},
        modifier_key_lists = keytable.modifier_key_lists,
        commands = {left_thumb_key_command, right_thumb_key_command, right_right_thumb_key_command},
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
