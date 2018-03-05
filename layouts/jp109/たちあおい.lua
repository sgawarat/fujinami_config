-- たちあおい v2.1
local assert = require "lib.assert"
local inspect = require "lib.inspect"
local layout = require "lib.layout"
local std = require "layouts.jp109.Standard"
local shr = require "layouts.jp109.SHR"

return layout.new {
  name = "たちあおい",
  build = function (model, keytable, options)
    local K = model:map_to_key()
    local C = model:map_to_char()

    local left_layout = options.left_layout or "A"
    local right_layout = options.right_layout or "A"

    -- である調向け
    -- local aoi_alphanumeric_commands = model:map_to_keys {
    --   {"1"}, {"2"}, {"3"}, {"4"}, {"5"},    {},      {"6"},      {"7"},      {"8"},      {"9"}, {"0"}, {"["}, {"]"},
    --   {"p"}, {"d"}, {"r"}, {"g"}, {"f"}, {"@"}, {"y", "e"}, {"y", "o"}, {"u"}, {"o"}, {"l"}, {"\""},
    --   {"n"}, {"s"}, {"t"}, {"k"}, {"h"}, {":"}, {"y", "u"},      {"a"}, {"i"}, {"e"}, {"q"}, {"x"},
    --   {"z"}, {"b"}, {"w"}, {"m"}, {"v"}, {";"}, {"y", "a"},      {"-"}, {","}, {"."}, {"/"},
    -- }
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

    local cao_alphanumeric_commands = nil
    local cao_alphanumeric_shift_commands = nil
    if options.cao_type == "QWERTY" then
      cao_alphanumeric_commands = model:map_to_keys(std.QWERTY_COMMANDS)
      cao_alphanumeric_shift_commands = model:map_to_keys(std.QWERTY_SHIFT_COMMANDS)
    elseif options.cao_type == "QWERTYSHR" then
      cao_alphanumeric_commands = model:map_to_keys(shr.QWERTY_COMMANDS)
      cao_alphanumeric_shift_commands = model:map_to_keys(shr.QWERTY_SHIFT_COMMANDS)
    elseif options.cao_type == "ColemakSHR" then
      cao_alphanumeric_commands = model:map_to_keys(shr.COLEMAK_COMMANDS)
      cao_alphanumeric_shift_commands = model:map_to_keys(shr.COLEMAK_SHIFT_COMMANDS)
    end

    return shr.build_layout {
      model = model,
      keytable = keytable,
      left_thumb_key_list = keytable:map(options.left_thumb_key or "Space"),
      left_thumb_key_role = options.left_thumb_key_role or KeyRole.TRIGGER,
      left_thumb_key_command = model:map_to_key(options.left_thumb_key_command or {"Space"}),
      right_thumb_key_list = keytable:map(options.right_thumb_key or "Convert"),
      right_thumb_key_role = options.right_thumb_key_role or KeyRole.TRIGGER,
      right_thumb_key_command = model:map_to_key(options.right_thumb_key_command or {"Enter"}),
      left_edit_key_list = keytable:map(options.left_edit_key or "NonConvert"),
      left_edit_key_role = options.left_edit_key_role or KeyRole.MODIFIER,
      left_edit_key_command = model:map_to_key(options.left_edit_key_command or {"Backspace"}),
      right_edit_key_list = keytable:map(options.right_edit_key or "KatakanaHiragana"),
      right_edit_key_role = options.right_edit_key_role or KeyRole.MODIFIER,
      right_edit_key_command = model:map_to_key(options.right_edit_key_command or {"Delete"}),
      alphanumeric_commands = alphanumeric_commands,
      alphanumeric_shift_commands = model:map_to_keys(shr.COLEMAK_SHIFT_COMMANDS),
      left_thumb_commands = model:map_to_keys(shr.LEFT_THUMB_COMMANDS),
      right_thumb_commands = model:map_to_keys(shr.RIGHT_THUMB_COMMANDS),
      left_edit_commands = model:map_to_keys(shr.LEFT_EDIT_COMMANDS),
      right_edit_commands = model:map_to_keys(shr.RIGHT_EDIT_COMMANDS),
      cao_alphanumeric_commands = cao_alphanumeric_commands,
      cao_alphanumeric_shift_commands = cao_alphanumeric_shift_commands,
    }
  end
}
