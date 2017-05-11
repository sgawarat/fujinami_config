local assert = require "lib.assert"

-- CommandName = "Name"
-- KeyAction = {Key.*[, Mod.*]}
-- CharAction: {"ab", "c"} = {"a", "b", "c"} = {"abc"}
-- AnyAction = ActionsName|KeyAction|CharAction
-- Command = {AnyAction, ...}

local function map_to_key(actions_map, command)
  assert.type("table", actions_map)
  assert.type("table", command)
  local result = {}
  for _, any_action in pairs(command) do
    if type(any_action) == "string" then
      if any_action == "" then
        table.insert(result, {})
      else
        -- any_actionがActionsNameなら、同名のKeyActionに変換する
        assert.table_ne(nil, actions_map, any_action)
        local actions = actions_map[any_action]
        for _, action in pairs(actions) do
          table.insert(result, action or {})
        end
      end
    elseif type(any_action) == "table" then
      -- any_actionが変換済みなら、そのまま受け渡す
      table.insert(result, any_action)
    else
      assert.fail("invalid type")
    end
  end
  return result
end

local function map_to_char(actions_map, command)
  assert.type("table", actions_map)
  assert.type("table", command)
  local result = {}
  for _, any_action in pairs(command) do
    if type(any_action) == "string" then
      if any_action == "" then
        table.insert(result, {})
      else
        -- any_actionがActionsNameなら、同名のCharActionに変換する
        table.insert(result, {any_action})
      end
    elseif type(any_action) == "table" then
      -- any_actionが変換済みなら、そのまま受け渡す
      table.insert(result, any_action)
    else
      assert.fail("invalid type")
    end
  end
  return result
end

local function map_to_keys(actions_map, commands)
  assert.type("table", actions_map)
  assert.type("table", commands)
  local result = {}
  for _, command in pairs(commands) do
    table.insert(result, map_to_key(actions_map, command))
  end
  return result
end

local function map_to_chars(actions_map, commands)
  assert.type("table", actions_map)
  assert.type("table", commands)
  local result = {}
  for _, command in pairs(commands) do
    table.insert(result, map_to_char(actions_map, command))
  end
  return result
end

--------------------------------------------------------------------------------

local impl = {}
local impl_mt = {
  __index = impl,
  __metatable = false,
}

function impl:apply(keytable)
  self.alphanumeric_commands = {}
  for _, key in pairs(keytable.alphanumeric_keys) do
    table.insert(self.alphanumeric_commands, {{key}})
  end
  self.non_alphanumeric_commands = {}
  for _, key in pairs(keytable.non_alphanumeric_keys) do
    table.insert(self.non_alphanumeric_commands, {{key}})
  end
end

function impl:map_to_key(command_or_nil)
  if command_or_nil == nil then
    return function(command)
      return map_to_key(self.actions_map, command)
    end
  else
    return map_to_key(self.actions_map, command_or_nil)
  end
end

function impl:map_to_char(command_or_nil)
  if command_or_nil == nil then
    return function(command)
      return map_to_char(self.actions_map, command)
    end
  else
    return map_to_char(self.actions_map, command_or_nil)
  end
end

function impl:map_to_keys(commands_or_nil)
  if commands_or_nil == nil then
    return function(commands)
      return map_to_keys(self.actions_map, commands)
    end
  else
    return map_to_keys(self.actions_map, commands_or_nil)
  end
end

function impl:map_to_chars(commands_or_nil)
  if commands_or_nil == nil then
    return function(commands)
      return map_to_chars(self.actions_map, commands)
    end
  else
    return map_to_chars(self.actions_map, commands_or_nil)
  end
end

--------------------------------------------------------------------------------

local module = {}
local module_mt = {
  __index = module,
  __newindex = function ()
    error("Attempt to modify read-only table")
  end,
  __metatable = false,
}

function module.new(t)
  assert.type("string", t.name)
  assert.type("table", t.actions_map)
  return setmetatable(t, impl_mt)
end

return setmetatable({}, module_mt)
