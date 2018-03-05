-- ColemakSHR
local assert = require "lib.assert"
local inspect = require "lib.inspect"
local layout = require "lib.layout"
local std = require "layouts.jp109.Standard"
local shr = require "layouts.jp109.SHR"

return layout.new {
  name = "ColemakSHR",
  build = function (model, keytable, options)
    local cao_alphanumeric_commands = nil
    local cao_alphanumeric_shift_commands = nil
    if options.cao_type == "QWERTY" then
      cao_alphanumeric_commands = model:map_to_keys(std.QWERTY_COMMANDS)
      cao_alphanumeric_shift_commands = model:map_to_keys(std.QWERTY_SHIFT_COMMANDS)
    elseif options.cao_type == "QWERTYSHR" then
      cao_alphanumeric_commands = model:map_to_keys(shr.QWERTY_COMMANDS)
      cao_alphanumeric_shift_commands = model:map_to_keys(shr.QWERTY_SHIFT_COMMANDS)
    else
      cao_alphanumeric_commands = colemak_alphanumeric_commands
      cao_alphanumeric_shift_commands = colemak_alphanumeric_shift_commands
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
      alphanumeric_commands = model:map_to_keys(shr.COLEMAK_COMMANDS),
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
