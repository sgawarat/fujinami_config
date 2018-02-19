-- たちあおい v2.1
local assert = require "lib.assert"
local inspect = require "lib.inspect"
local layout = require "lib.layout"
local shr = require "layouts.jp109.SHR"

return layout.new {
  name = "たちあおい",
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
    local left_layout = options.left_layout or "A"
    local right_layout = options.right_layout or "A"

    -- である調向け
    local aoi_alphanumeric_commands = model:map_to_keys {
      {"1"}, {"2"}, {"3"}, {"4"}, {"5"},    {},      {"6"},      {"7"},      {"8"},      {"9"}, {"0"}, {"["}, {"]"},
      {"p"}, {"d"}, {"r"}, {"g"}, {"f"}, {"@"}, {"y", "e"}, {"y", "o"}, {"u"}, {"o"}, {"l"}, {"\""},
      {"n"}, {"s"}, {"t"}, {"k"}, {"h"}, {":"}, {"y", "u"},      {"a"}, {"i"}, {"e"}, {"q"}, {"x"},
      {"z"}, {"b"}, {"w"}, {"m"}, {"v"}, {";"}, {"y", "a"},      {"-"}, {","}, {"."}, {"/"},
    }
    local left_alphanumeric_command_lists = {
      ["A"] = model:map_to_keys {
        {"1"}, {"2"}, {"3"}, {"4"}, {"5"},
        {"p"}, {"d"}, {"r"}, {"g"}, {"f"},
        {"n"}, {"s"}, {"t"}, {"k"}, {"h"},
        {"z"}, {"b"}, {"w"}, {"m"}, {"v"},
      },
      ["A-gh"] = model:map_to_keys {
        {"1"}, {"2"}, {"3"}, {"4"}, {"5"},
        {"p"}, {"d"}, {"r"}, {"h"}, {"f"},
        {"n"}, {"s"}, {"t"}, {"k"}, {"g"},
        {"z"}, {"b"}, {"w"}, {"m"}, {"v"},
      },
      ["B-tr"] = model:map_to_keys {
        {"1"}, {"2"}, {"3"}, {"4"}, {"5"},
        {"p"}, {"n"}, {"d"}, {"h"}, {"f"},
        {"t"}, {"r"}, {"s"}, {"k"}, {"g"},
        {"z"}, {"b"}, {"w"}, {"m"}, {"v"},
      },
      ["B-nr"] = model:map_to_keys {
        {"1"}, {"2"}, {"3"}, {"4"}, {"5"},
        {"p"}, {"t"}, {"d"}, {"h"}, {"f"},
        {"n"}, {"r"}, {"s"}, {"k"}, {"g"},
        {"z"}, {"b"}, {"w"}, {"m"}, {"v"},
      },
      ["B-nt"] = model:map_to_keys {
        {"1"}, {"2"}, {"3"}, {"4"}, {"5"},
        {"p"}, {"r"}, {"d"}, {"h"}, {"f"},
        {"n"}, {"t"}, {"s"}, {"k"}, {"g"},
        {"z"}, {"b"}, {"w"}, {"m"}, {"v"},
      },
    }
    local right_alphanumeric_command_lists = {
      ["A"] = model:map_to_keys {
          {},      {"6"},      {"7"}, {"8"}, {"9"}, {"0"}, {"["}, {"]"},
        {"@"}, {"y", "e"}, {"y", "o"}, {"u"}, {"o"}, {"l"}, {"\""},
        {":"}, {"y", "u"},      {"a"}, {"i"}, {"e"}, {"q"}, {"x"},
        {";"}, {"y", "a"},      {"-"}, {","}, {"."}, {"/"},
      },
      ["A-ei"] = model:map_to_keys {
          {},      {"6"},      {"7"}, {"8"}, {"9"}, {"0"}, {"["}, {"]"},
        {"@"}, {"y", "e"}, {"y", "o"}, {"u"}, {"o"}, {"l"}, {"\""},
        {":"}, {"y", "u"},      {"a"}, {"e"}, {"i"}, {"q"}, {"x"},
        {";"}, {"y", "a"},      {"-"}, {","}, {"."}, {"/"},
      },
    }
    local L = left_alphanumeric_command_lists[left_layout]
    local R = right_alphanumeric_command_lists[right_layout]
    local alphanumeric_commands = {
      L[1], L[2], L[3], L[4], L[5], R[1], R[2], R[3], R[4], R[5], R[6], R[7], R[8],
      L[6], L[7], L[8], L[9], L[10], R[9], R[10], R[11], R[12], R[13], R[14], R[15],
      L[11], L[12], L[13], L[14], L[15], R[16], R[17], R[18], R[19], R[20], R[21], R[22],
      L[16], L[17], L[18], L[19], L[20], R[23], R[24], R[25], R[26], R[27], R[28],
    }

--    local alphanumeric_shift_commands = model:map_to_keys(shr.QWERTY_SHIFT_COMMANDS)
    local alphanumeric_shift_commands = model:map_to_keys(shr.COLEMAK_SHIFT_COMMANDS)
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
    elseif options.cao_type == "ColemakSHR" then
      cao_alphanumeric_commands = model:map_to_keys(shr.COLEMAK_COMMANDS)
      cao_alphanumeric_shift_commands = model:map_to_keys(shr.COLEMAK_SHIFT_COMMANDS)
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
        commands = alphanumeric_commands,
        shift_commands = alphanumeric_shift_commands,
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
        trigger_key_lists = {left_thumb_key_list, right_thumb_key_list},
        modifier_key_lists = keytable.modifier_key_lists,
        commands = {left_thumb_key_command, right_thumb_key_command},
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
