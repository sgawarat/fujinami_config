local assert = require "lib.assert"

local function find_key_list(key_list_map, name)
  assert.type("table", key_list_map)
  assert.type("string", name)
  if name == "" then
    return {}
  else
    return key_list_map[name] or {}
  end
end

local function find_key_lists(key_list_map, names)
  assert.type("table", key_list_map)
  assert.type("table", names)
  local key_lists = {}
  for _, name in pairs(names) do
    table.insert(key_lists, find_key_list(key_list_map, name))
  end
  return key_lists
end

local function map(key_list_map, name_or_names)
  if type(name_or_names) == "string" then
    return find_key_list(key_list_map, name_or_names)
  elseif type(name_or_names) == "table" then
    return find_key_lists(key_list_map, name_or_names)
  else
    assert.fail("invalid type")
  end
end

--------------------------------------------------------------------------------

local impl = {}
local impl_mt = {
  __index = impl,
  __metatable = false,
}

function impl:apply(options)
  self.key_list_map = {}
  for k, v in pairs(self.key_map) do
    local name = options and (options.remap[k] or k) or k
    if self.key_list_map[name] == nil then
      self.key_list_map[name] = {}
    end
    table.insert(self.key_list_map[name], v)
  end

  self.alphanumeric_key_lists = self:map(self.alphanumeric_key_names)
  self.non_alphanumeric_key_lists = self:map(self.non_alphanumeric_key_names)
  self.modifier_key_lists = self:map(self.modifier_key_names)
end

function impl:map(name_or_names_or_nil)
  if name_or_names_or_nil == nil then
    return function (name_or_names)
      return map(self.key_list_map, name_or_names)
    end
  else
    return map(self.key_list_map, name_or_names_or_nil)
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
  assert.type("table", t)
  assert.type("string", t.name)
  assert.type("string", t.model_name)
  assert.type("table", t.key_map)
  return setmetatable(t, impl_mt)
end

return setmetatable({}, module_mt)
