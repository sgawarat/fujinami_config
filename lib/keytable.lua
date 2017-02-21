local assert = require "lib.assert"

local function find_key(key_map, name)
  assert.type("table", key_map)()
  assert.type("string", name)()
  if name == "" then
    return 0
  else
    return key_map[name] or 0
  end
end

local function find_keys(key_map, names)
  assert.type("table", key_map)()
  assert.type("table", names)()
  local keys = {}
  for _, name in pairs(names) do
    table.insert(keys, find_key(key_map, name))
  end
  return keys
end


local function map(key_map, name_or_names)
  if type(name_or_names) == "string" then
    return find_key(key_map, name_or_names)
  elseif type(name_or_names) == "table" then
    return find_keys(key_map, name_or_names)
  else
    assert.fail("invalid type")
  end
end

--------------------------------------------------------------------------------

local impl = {}
local impl_mt = {
  __index = impl,
  __newindex = function ()
    error("Attempt to modify read-only table")
  end,
  __metatable = false,
}

function impl:map(name_or_names_or_nil)
  if name_or_names_or_nil == nil then
    return function (name_or_names)
      return map(self.key_map, name_or_names)
    end
  else
    return map(self.key_map, name_or_names_or_nil)
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
  assert.type("table", t)()
  assert.type("string", t.name)()
  assert.type("string", t.model_name)()
  assert.type("table", t.key_map)()
  return setmetatable(t, impl_mt)
end

return setmetatable({}, module_mt)
