require("platform." .. Platform.NAME)

local assert = require "lib.assert"

local current_model = nil
local current_keytable = nil

local MODIFIER_KEYS = {
  Key.SHIFT_LEFT, Key.CONTROL_LEFT, Key.ALT_LEFT, Key.OS_LEFT,
  Key.SHIFT_RIGHT, Key.CONTROL_RIGHT, Key.ALT_RIGHT, Key.OS_RIGHT,
}
local CAO_MODIFIER_KEYS = {
  Key.CONTROL_LEFT, Key.ALT_LEFT, Key.OS_LEFT,
  Key.CONTROL_RIGHT, Key.ALT_RIGHT, Key.OS_RIGHT,
}
local MODIFIER_MASKS = {
  Mod.SHIFT_LEFT, Mod.CONTROL_LEFT, Mod.ALT_LEFT, Mod.OS_LEFT,
  Mod.SHIFT_RIGHT, Mod.CONTROL_RIGHT, Mod.ALT_RIGHT, Mod.OS_RIGHT
}
local CAO_MODIFIER_MASKS = {
  Mod.CONTROL_LEFT, Mod.ALT_LEFT, Mod.OS_LEFT,
  Mod.CONTROL_RIGHT, Mod.ALT_RIGHT, Mod.OS_RIGHT,
}
local MODIFIER_LEFT_MASKS = {
  Mod.SHIFT_LEFT, Mod.CONTROL_LEFT, Mod.ALT_LEFT, Mod.OS_LEFT
}
local MODIFIER_RIGHT_MASKS = {
  Mod.SHIFT_RIGHT, Mod.CONTROL_RIGHT, Mod.ALT_RIGHT, Mod.OS_RIGHT
}
local MODIFIER_BOTH_MASKS = {
  Mod.SHIFT_LEFT | Mod.SHIFT_RIGHT, Mod.CONTROL_LEFT | Mod.CONTROL_RIGHT, Mod.ALT_LEFT | Mod.ALT_RIGHT, Mod.OS_LEFT | Mod.OS_RIGHT
}

-- action[2]: コマンドが必要とする修飾キー
-- extra_mods: 生成処理が必要とする修飾キー
-- swap_sides: 必要とする修飾キーに与える方向
local function modify_command(base_command, extra_mods, swap_sides)
  assert.type("table", base_command)()
  assert.type("number", extra_mods)()
  assert.type("number", swap_sides)()

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

local function create_mappings(handle, keys, commands, shift_commands, extra_mods)
  assert.type("table", keys)()
  assert.type("table", commands)()
  assert.type("table", shift_commands)()
  assert.eq(#keys, #commands)()
  assert.eq(#keys, #shift_commands)()

  for i = 1, #keys do
    assert.table_ne(nil, keys, i)

    -- default
    fujinami.create_mapping(
        handle,
        {{keys[i], KeyRole.TRIGGER}},
        commands[i])

    -- ShiftLeft+
    fujinami.create_mapping(
        handle,
        {{keys[i], KeyRole.TRIGGER}, {Key.SHIFT_LEFT, KeyRole.MODIFIER}},
        modify_command(shift_commands[i], extra_mods, Mod.SHIFT_LEFT))

    -- ShiftRight+
    fujinami.create_mapping(
        handle,
        {{keys[i], KeyRole.TRIGGER}, {Key.SHIFT_RIGHT, KeyRole.MODIFIER}},
        modify_command(shift_commands[i], extra_mods, Mod.SHIFT_RIGHT))

    -- ShiftLeft+ShiftRight+
    fujinami.create_mapping(
        handle,
        {{keys[i], KeyRole.TRIGGER}, {Key.SHIFT_LEFT, KeyRole.MODIFIER}, {Key.SHIFT_RIGHT, KeyRole.MODIFIER}},
        modify_command(shift_commands[i], extra_mods, Mod.SHIFT_LEFT | Mod.SHIFT_RIGHT))
  end
end

local function create_cao_mappings(handle, keys, commands, shift_commands, extra_mods)
  assert.type("table", keys)()
  assert.type("table", commands)()
  assert.type("table", shift_commands)()
  assert.eq(#keys, #commands)()
  assert.eq(#keys, #shift_commands)()

  for cao_mods = 1, (1 << #CAO_MODIFIER_MASKS) - 1 do
    local active_keys = {}
    local mods = 0
    for i = 1, #CAO_MODIFIER_MASKS do
      if cao_mods & (1 << (i - 1)) ~= 0 then
        table.insert(active_keys, {CAO_MODIFIER_KEYS[i], KeyRole.MODIFIER})
        mods = mods | CAO_MODIFIER_MASKS[i]
      end
    end

    for i = 1, #keys do
      assert.table_ne(nil, keys, i)()

      -- default
      table.insert(active_keys, {keys[i], KeyRole.TRIGGER})
      fujinami.create_mapping(
          handle,
          active_keys,
          modify_command(commands[i], mods, mods))

      -- ShiftLeft+
      table.insert(active_keys, {Key.SHIFT_LEFT, KeyRole.MODIFIER})
      fujinami.create_mapping(
          handle,
          active_keys,
          modify_command(shift_commands[i], extra_mods | mods, Mod.SHIFT_LEFT | mods))
      table.remove(active_keys)

      -- ShiftRight+
      table.insert(active_keys, {Key.SHIFT_RIGHT, KeyRole.MODIFIER})
      fujinami.create_mapping(
          handle,
          active_keys,
          modify_command(shift_commands[i], extra_mods | mods, Mod.SHIFT_RIGHT | mods))
      table.remove(active_keys)

      -- ShiftLeft+ShiftRight+
      table.insert(active_keys, {Key.SHIFT_LEFT, KeyRole.MODIFIER})
      table.insert(active_keys, {Key.SHIFT_RIGHT, KeyRole.MODIFIER})
      fujinami.create_mapping(
          handle,
          active_keys,
          modify_command(shift_commands[i], extra_mods | mods, Mod.SHIFT_LEFT | Mod.SHIFT_RIGHT | mods))
      table.remove(active_keys)
      table.remove(active_keys)

      -- remove a trigger key
      table.remove(active_keys)
    end
  end
end

--------------------------------------------------------------------------------

-- フローを定義する
function flow(t)
  assert.type("table", t)()
  assert.type("number", t.key)()
  assert.type("number", t.flow_type)()
  fujinami.create_flow(handle, key, flow_type)
end

-- 単独押しキーを定義する
function immediate_key_flows(t)
  assert.type("table", t)()
  assert.type("table", t.key_lists)()
  return function (handle)
    for _, keys in pairs(t.key_lists) do
      assert.type("table", keys)()
      for _, key in pairs(keys) do
        assert.type("number", key)()
        fujinami.create_flow(handle, key, FlowType.IMMEDIATE)
      end
    end
  end
end

-- 同時押しキーを定義する
function deferred_key_flows(t)
  assert.type("table", t)()
  assert.type("table", t.key_lists)()
  return function (handle)
    for _, keys in pairs(t.key_lists) do
      assert.type("table", keys)()
      for _, key in pairs(keys) do
        assert.type("number", key)()
        fujinami.create_flow(handle, key, FlowType.DEFERRED)
      end
    end
  end
end

--------------------------------------------------------------------------------

-- マッピングを定義する
function mapping(t)
  assert.type("table", t)()
  assert.type("table", t.active_keys)()
  assert.type("table", t.commands)()
  assert.eq(#t.keys, #t.commands)()

  return function (handle)
    for i = 1, #t.active_keys do
      fujinami.create_mapping(handle, t.active_keys[i], t.commands[i])
    end
  end
end

-- 単純な記述でマッピングを定義する
function simple_mappings(t)
  assert.type("table", t)()
  assert.type("table", t.keys)()
  assert.type("table", t.commands)()

  return function (handle)
    local shift_commands = t.shift_commands or t.commands
    local cao_commands = t.cao_commands or t.commands
    local cao_shift_commands = t.cao_shift_commands or shift_commands
    local extra_mods = t.shift_commands and 0 or Mod.SHIFT
    local cao_extra_mods = t.cao_shift_commands and 0 or extra_mods

    create_mappings(handle, t.keys, t.commands, shift_commands, extra_mods)
    create_cao_mappings(handle, t.keys, cao_commands, cao_shift_commands, cao_extra_mods)
  end
end

-- キーをそのままにコマンドとしたマッピングを定義する
function passthrough_mappings(t)
  assert.type("table", t)()
  assert.type("table", t.keys)()

  return function (handle)
    for mods = 0, Mod.ALL do
      local active_keys = {}

      for i, mod in ipairs(MODIFIER_MASKS) do
        if mods & mod ~= 0 then
          table.insert(active_keys, {MODIFIER_KEYS[i], KeyRole.MODIFIER})
        end
      end

      for i = 1, #t.keys do
        assert.table_ne(nil, t.keys, i)()

        table.insert(active_keys, {t.keys[i], KeyRole.TRIGGER})
        fujinami.create_mapping(handle, active_keys, {{t.keys[i], mods}})
        table.remove(active_keys)
      end
    end
  end
end

-- 任意の修飾キーを指定するマッピングを定義する
function extended_mappings(t)
  assert.type("table", t)()
  assert.type("table", t.keys)()
  assert.type("table", t.shift_keys)()
  assert.type("table", t.commands)()
  assert.eq(#t.keys, #t.commands)()

  return function (handle)
    local active_keys = t.shift_keys
    for i = 1, #t.keys do
      table.insert(active_keys, {t.keys[i], KeyRole.TRIGGER})
      fujinami.create_mapping(handle, active_keys, modify_command(t.commands[i], t.extra_mods or 0, t.mod_sides or 0))
      table.remove(active_keys)
    end
  end
end

-- 標準の修飾キーを組み合わせたマッピングを定義する
function modifiers_mappings()
  return function (handle)
    for mods = 1, Mod.ALL do
      local active_keys = {}
      for i, mod in ipairs(MODIFIER_MASKS) do
        if mods & mod ~= 0 then
          table.insert(active_keys, {MODIFIER_KEYS[i], KeyRole.MODIFIER})
        end
      end

      fujinami.create_mapping(handle, active_keys, {{0, mods}})
    end
  end
end

--------------------------------------------------------------------------------

function next_layout(t)
  assert.type("table", t)()
  assert.type("table", t.keys)()
  assert.type("string", t.name)()
  return function (handle)
    fujinami.create_next_layout(handle, t.keys, t.name)
  end
end

--------------------------------------------------------------------------------

function global_option(t)
  assert.type("table", t)()
  fujinami.set_global_option(t)
end

function model(model_or_model_name)
  if type(model_or_model_name) == "string" then
    current_model = require("models." .. model_or_model_name)
  elseif type(model_or_model_name) == "table" then
    current_model = model_or_model_name
  else
    assert.fail("type(%s) is neither string nor table", model_or_model_name)
  end
end

function keytable(keytable_or_keytable_name)
  if type(keytable_or_keytable_name) == "string" then
    current_keytable = require("keytables." .. current_model.name .. "." .. keytable_or_keytable_name)
  elseif type(keytable_or_keytable_name) == "table" then
    current_keytable = keytable_or_keytable_name
  else
    assert.fail("type(%s) is neither string nor table", keytable_or_keytable_name)
  end
end

function layout(layout_or_layout_name)
  assert.ne(nil, current_keytable)()
  assert.ne(nil, current_model)()
  if type(layout_or_layout_name) == "string" then
    local layout_id = current_keytable.name .. "." .. layout_or_layout_name
    local layout = require("layouts." .. layout_id)
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
