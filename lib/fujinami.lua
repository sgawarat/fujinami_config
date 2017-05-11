require("platform." .. Platform.NAME)

local assert = require "lib.assert"
local inspect = require "lib.inspect"

local MODIFIER_KEYS = {
  Key.SHIFT_LEFT, Key.SHIFT_RIGHT,
  Key.CONTROL_LEFT, Key.CONTROL_RIGHT,
  Key.ALT_RIGHT, Key.ALT_LEFT,
  Key.OS_LEFT, Key.OS_RIGHT,
}
local MODIFIER_MASKS = {
  Mod.SHIFT_LEFT, Mod.SHIFT_RIGHT,
  Mod.CONTROL_LEFT, Mod.CONTROL_RIGHT,
  Mod.ALT_LEFT, Mod.ALT_RIGHT,
  Mod.OS_LEFT, Mod.OS_RIGHT,
}
local MODIFIER_BOTH_MASKS = {
  Mod.SHIFT_LEFT | Mod.SHIFT_RIGHT,
  Mod.CONTROL_LEFT | Mod.CONTROL_RIGHT,
  Mod.ALT_LEFT | Mod.ALT_RIGHT,
  Mod.OS_LEFT | Mod.OS_RIGHT,
}

-- action[2]: コマンドが必要とする修飾キー
-- extra_mods: 生成処理が必要とする修飾キー
-- swap_sides: 必要とする修飾キーに与える方向
local function modify_command(base_command, extra_mods, swap_sides)
  assert.type("table", base_command)
  assert.type("number", extra_mods)
  assert.type("number", swap_sides)

  local command = {}
  for _, action in pairs(base_command) do
    if type(action) == "table" then
      if type(action[1]) == "number" then
        -- actionがKeyActionなら、その修飾キーを修正する
        local orig_mods = action[2] or 0
        local req_mods = orig_mods | extra_mods
        local mods = 0
        for _, both_mods in pairs(MODIFIER_BOTH_MASKS) do
          if req_mods & both_mods ~= 0 and swap_sides & both_mods ~= 0 then
            mods = mods | (swap_sides & both_mods)
          else
            mods = mods | (orig_mods & both_mods)
          end
        end
        table.insert(command, {action[1], mods})
      else
        table.insert(command, action)
      end
    else
      assert.fail("invalid type")
    end
  end
  return command
end

-- trigger_key_lists = {{keyA1, keyA2}, {keyB1, ...}, ...}
-- modifier_key_lists = {{shift_left, ...}, {shift_right, ...}, {ctrl_left, ...}, ...}
local function create_mappings(handle, trigger_key_lists, modifier_key_lists, commands, shift_commands_or_nil)
  local shift_commands = shift_commands_or_nil or commands
  local shift_extra_mods = shift_commands_or_nil and 0 or Mod.SHIFT

  for i, keys in ipairs(trigger_key_lists) do
    local command = modify_command(commands[i], 0, 0)
    local shift_left_command = modify_command(shift_commands[i], shift_extra_mods, Mod.SHIFT_LEFT)
    local shift_right_command = modify_command(shift_commands[i], shift_extra_mods, Mod.SHIFT_RIGHT)
    local shift_both_command = modify_command(shift_commands[i], shift_extra_mods, Mod.SHIFT_LEFT | Mod.SHIFT_RIGHT)

    for _, key in pairs(keys) do
      fujinami.create_mapping(
          handle,
          {{key, KeyRole.TRIGGER}},
          command)

      for _, shift_left_key in pairs(modifier_key_lists[1]) do
        fujinami.create_mapping(
            handle,
            {{key, KeyRole.TRIGGER}, {shift_left_key, KeyRole.MODIFIER}},
            shift_left_command)

        for _, shift_right_key in pairs(modifier_key_lists[2]) do
          fujinami.create_mapping(
              handle,
              {{key, KeyRole.TRIGGER}, {shift_left_key, KeyRole.MODIFIER}, {shift_right_key, KeyRole.MODIFIER}},
              shift_both_command)
        end
      end

      for _, shift_right_key in pairs(modifier_key_lists[2]) do
        fujinami.create_mapping(
            handle,
            {{key, KeyRole.TRIGGER}, {shift_right_key, KeyRole.MODIFIER}},
            shift_right_command)
      end
    end
  end
end

local function create_cao_mappings(handle, trigger_key_lists, modifier_key_lists, commands, shift_commands_or_nil)
  local shift_commands = shift_commands_or_nil or commands
  local shift_extra_mods = shift_commands_or_nil and 0 or Mod.SHIFT

  local modifier_key_indexes = {0, 0, 0, 0, 0, 0}
  while true do
    local active_keys = {}
    local mods = 0
    local mod_i = 1
    while mod_i <= (#modifier_key_lists - 2) do
      if modifier_key_indexes[mod_i] < #modifier_key_lists[mod_i + 2] then
        modifier_key_indexes[mod_i] = modifier_key_indexes[mod_i] + 1
        table.insert(active_keys, {
            modifier_key_lists[mod_i + 2][modifier_key_indexes[mod_i]],
            KeyRole.MODIFIER})
        mods = mods | MODIFIER_MASKS[mod_i + 2]
        mod_i = mod_i + 1
        break
      else
        modifier_key_indexes[mod_i] = 0
        mod_i = mod_i + 1
      end
    end
    if mods == 0 then
      break
    end
    while mod_i <= (#modifier_key_lists - 2) do
        if modifier_key_indexes[mod_i] ~= 0 then
          table.insert(active_keys, {
              modifier_key_lists[mod_i + 2][modifier_key_indexes[mod_i]],
              KeyRole.MODIFIER})
          mods = mods | MODIFIER_MASKS[mod_i + 2]
        end
        mod_i = mod_i + 1
    end

    for i, keys in ipairs(trigger_key_lists) do
      local command = modify_command(commands[i], mods, mods)
      local shift_left_command = modify_command(shift_commands[i], shift_extra_mods | mods, Mod.SHIFT_LEFT | mods)
      local shift_right_command = modify_command(shift_commands[i], shift_extra_mods | mods, Mod.SHIFT_RIGHT | mods)
      local shift_both_command = modify_command(shift_commands[i], shift_extra_mods | mods, Mod.SHIFT_LEFT | Mod.SHIFT_RIGHT | mods)

      for _, key in pairs(keys) do
        table.insert(active_keys, {key, KeyRole.TRIGGER})
        fujinami.create_mapping(
            handle,
            active_keys,
            command)

        for _, shift_left_key in pairs(modifier_key_lists[1]) do
          table.insert(active_keys, {shift_left_key, KeyRole.MODIFIER})
          fujinami.create_mapping(
              handle,
              active_keys,
              shift_left_command)

          for _, shift_right_key in pairs(modifier_key_lists[2]) do
            table.insert(active_keys, {shift_right_key, KeyRole.MODIFIER})
            fujinami.create_mapping(
                handle,
                active_keys,
                shift_both_command)
            table.remove(active_keys)
          end
          table.remove(active_keys)
        end

        for _, shift_right_key in pairs(modifier_key_lists[2]) do
          table.insert(active_keys, {shift_right_key, KeyRole.MODIFIER})
          fujinami.create_mapping(
              handle,
              active_keys,
              shift_right_command)
          table.remove(active_keys)
        end

        table.remove(active_keys)
      end
    end
  end
end

local function create_passthrough_mappings(handle, trigger_key_lists, modifier_key_lists)
  for i, keys in ipairs(trigger_key_lists) do
    for _, key in pairs(keys) do
      fujinami.create_mapping(
          handle,
          {{key, KeyRole.TRIGGER}},
          {{key}})
    end
  end

  local modifier_key_indexes = {0, 0, 0, 0, 0, 0, 0, 0}
  while true do
    local active_keys = {}
    local mods = 0
    local mod_i = 1
    while mod_i <= #modifier_key_lists do
      if modifier_key_indexes[mod_i] < #modifier_key_lists[mod_i] then
        modifier_key_indexes[mod_i] = modifier_key_indexes[mod_i] + 1
        table.insert(active_keys, {
            modifier_key_lists[mod_i][modifier_key_indexes[mod_i]],
            KeyRole.MODIFIER})
        mods = mods | MODIFIER_MASKS[mod_i]
        mod_i = mod_i + 1
        break
      else
        modifier_key_indexes[mod_i] = 0
        mod_i = mod_i + 1
      end
    end
    if mods == 0 then
      break
    end
    while mod_i <= #modifier_key_lists do
        if modifier_key_indexes[mod_i] ~= 0 then
          table.insert(active_keys, {
              modifier_key_lists[mod_i][modifier_key_indexes[mod_i]],
              KeyRole.MODIFIER})
          mods = mods | MODIFIER_MASKS[mod_i]
        end
        mod_i = mod_i + 1
    end

    for i, keys in ipairs(trigger_key_lists) do
      for _, key in pairs(keys) do
        table.insert(active_keys, {key, KeyRole.TRIGGER})
        fujinami.create_mapping(
            handle,
            active_keys,
            {{key, mods}})
        table.remove(active_keys)
      end
    end
  end
end

local function create_modifiers_mappings(handle, modifier_key_lists)
  local modifier_key_indexes = {0, 0, 0, 0, 0, 0, 0, 0}
  while true do
    local active_keys = {}
    local mods = 0
    local mod_i = 1
    while mod_i <= #modifier_key_lists do
      if modifier_key_indexes[mod_i] < #modifier_key_lists[mod_i] then
        modifier_key_indexes[mod_i] = modifier_key_indexes[mod_i] + 1
        table.insert(active_keys, {
            modifier_key_lists[mod_i][modifier_key_indexes[mod_i]],
            KeyRole.MODIFIER})
        mods = mods | MODIFIER_MASKS[mod_i]
        mod_i = mod_i + 1
        break
      else
        modifier_key_indexes[mod_i] = 0
        mod_i = mod_i + 1
      end
    end
    if mods == 0 then
      break
    end
    while mod_i <= #modifier_key_lists do
        if modifier_key_indexes[mod_i] ~= 0 then
          table.insert(active_keys, {
              modifier_key_lists[mod_i][modifier_key_indexes[mod_i]],
              KeyRole.MODIFIER})
          mods = mods | MODIFIER_MASKS[mod_i]
        end
        mod_i = mod_i + 1
    end

    fujinami.create_mapping(
        handle,
        active_keys,
        {{0, mods}})
  end
end

--------------------------------------------------------------------------------

-- フローを定義する
function flow(t)
  assert.type("table", t)
  assert.type("number", t.key)
  assert.type("number", t.flow_type)
  fujinami.create_flow(handle, key, flow_type)
end

-- 単独押しキーを定義する
function immediate_key_flows(t)
  assert.type("table", t)
  assert.type("table", t.key_lists)
  return function (handle)
    for _, keys in pairs(t.key_lists) do
      assert.type("table", keys)
      for _, key in pairs(keys) do
        assert.type("number", key)
        fujinami.create_flow(handle, key, FlowType.IMMEDIATE)
      end
    end
  end
end

-- 同時押しキーを定義する
function deferred_key_flows(t)
  assert.type("table", t)
  assert.type("table", t.key_lists)
  return function (handle)
    for _, keys in pairs(t.key_lists) do
      assert.type("table", keys)
      for _, key in pairs(keys) do
        assert.type("number", key)
        fujinami.create_flow(handle, key, FlowType.DEFERRED)
      end
    end
  end
end

-- 同時押しキーを定義する
function simul_key_flows(t)
  assert.type("table", t)
  assert.type("table", t.key_lists)
  return function (handle)
    for _, keys in pairs(t.key_lists) do
      assert.type("table", keys)
      for _, key in pairs(keys) do
        assert.type("number", key)
        fujinami.create_flow(handle, key, FlowType.SIMUL)
      end
    end
  end
end

--------------------------------------------------------------------------------

-- マッピングを定義する
function mapping(t)
  assert.type("table", t)
  assert.type("table", t.active_keys)
  assert.type("table", t.commands)
  assert.eq(#t.active_keys, #t.commands)

  return function (handle)
    for i = 1, #t.active_keys do
      fujinami.create_mapping(handle, t.active_keys[i], t.commands[i])
    end
  end
end

-- 単純な記述でマッピングを定義する
function simple_mappings(t)
  assert.type("table", t)
  assert.type("table", t.trigger_key_lists)
  assert.type("table", t.modifier_key_lists)
  assert.type("table", t.commands)
  assert.eq(#t.trigger_key_lists, #t.commands)
  assert.eq(#t.modifier_key_lists, #MODIFIER_KEYS)

  return function (handle)
    local cao_commands = t.cao_commands or t.commands
    local cao_shift_commands = t.cao_shift_commands or t.shift_commands

    create_mappings(
        handle,
        t.trigger_key_lists,
        t.modifier_key_lists,
        t.commands,
        t.shift_commands)
    create_cao_mappings(
        handle,
        t.trigger_key_lists,
        t.modifier_key_lists,
        cao_commands,
        cao_shift_commands)
  end
end

-- キーをそのままにコマンドとしたマッピングを定義する
function passthrough_mappings(t)
  assert.type("table", t)
  assert.type("table", t.trigger_key_lists)
  assert.type("table", t.modifier_key_lists)

  return function (handle)
    create_passthrough_mappings(
        handle,
        t.trigger_key_lists,
        t.modifier_key_lists)
  end
end

-- 任意の修飾キーを指定するマッピングを定義する
function extended_mappings(t)
  assert.type("table", t)
  assert.type("table", t.trigger_key_lists)
  assert.type("table", t.shift_key_list)
  assert.type("table", t.commands)
  assert.eq(#t.trigger_key_lists, #t.commands)

  return function (handle)
    local shift_key_role = t.shift_key_list[2] or KeyRole.TRIGGER
    for _, shift_key in pairs(t.shift_key_list[1]) do
      local active_keys = {{shift_key, shift_key_role}}

      for i, key_list in ipairs(t.trigger_key_lists) do
        local command = modify_command(
            t.commands[i],
            t.extra_mods or 0,
            t.mod_sides or 0)
        for _, key in pairs(key_list) do
          table.insert(active_keys, {key, KeyRole.TRIGGER})
          fujinami.create_mapping(
              handle,
              active_keys,
              command)
          table.remove(active_keys)
        end
      end
    end
  end
end

-- 標準の修飾キーを組み合わせたマッピングを定義する
function modifiers_mappings(t)
  return function (handle)
    create_modifiers_mappings(handle, t.modifier_key_lists)
  end
end

--------------------------------------------------------------------------------

function next_layout(t)
  assert.type("table", t)
  assert.type("table", t.keys)
  assert.type("string", t.name)
  return function (handle)
    fujinami.create_next_layout(handle, t.keys, t.name)
  end
end

--------------------------------------------------------------------------------

-- 状態
local current_model = nil
local current_keytable = nil
local current_keytable_options = nil

function global_option(t)
  assert.type("table", t)
  fujinami.set_global_option(t)
end

function model(model_or_model_name)
  assert.types({"string", "table"}, model_or_model_name)
  current_model = model_or_model_name
end

function keytable(keytable_or_keytable_name)
  assert.types({"string", "table"}, keytable_or_keytable_name)
  current_keytable = keytable_or_keytable_name
  current_keytable_options = nil

  return function (options)
    current_keytable_options = options
  end
end

function layout(layout_or_layout_name)
  assert.ne(nil, current_keytable)
  assert.ne(nil, current_model)

  if type(current_model) == "string" then
    current_model = wrequire("models." .. current_model)
  end
  if type(current_model) ~= "table" then
    assert.fail("current model is not valid (model:%s)", current_model)
  end

  if type(current_keytable) == "string" then
    current_keytable = wrequire("keytables." .. current_model.name .. "." .. current_keytable)
  end
  if type(current_keytable) ~= "table" then
    assert.fail("current keytable is not valid (keytable:%s)", current_keytable)
  end

  current_keytable:apply(current_keytable_options)
  current_model:apply(current_keytable)

  if type(layout_or_layout_name) == "string" then
    local layout_id = current_keytable.name .. "." .. layout_or_layout_name
    local layout = wrequire("layouts." .. layout_id)
    local handle = fujinami.get_layout_handle(layout_id)
    local model = current_model
    local keytable = current_keytable
    return function (options)
      layout:apply(handle, model, keytable, options)
    end
  elseif type(layout_or_layout_name) == "table" then
    local layout_id = current_keytable.name .. "." .. layout_or_layout_name.name
    local handle = fujinami.get_layout_handle(layout_id)
    local model = current_model
    local keytable = current_keytable
    return function (options)
      layout_or_layout_name:apply(handle, model, keytable, options)
    end
  else
    assert.fail("type(%s) is neither string nor table", layout_or_layout_name)
  end
end

function custom_layout(name)
  local handle = fujinami.get_layout_handle(name)
  return function (definitions)
    for _, func in pairs(definitions) do
      func(handle)
    end
  end
end
