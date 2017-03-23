local assert = require "lib.assert"

--------------------------------------------------------------------------------

local impl = {}
local impl_mt = {
  __index = impl,
  __newindex = function ()
    error("Attempt to modify read-only table")
  end,
  __metatable = false,
}

function impl:apply(handle, model, keytable, options)
  local definitions = self.build and self.build(model, keytable, options) or (self.definitions or {})
  for _, func in pairs(definitions) do
    func(handle)
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
  return setmetatable(t, impl_mt)
end

return setmetatable({}, module_mt)
