local inspect = require "lib.inspect"

local function format(msg, ...)
  local args = table.pack(...)
  local arg_strs = {}
  for i = 1, args.n do
    table.insert(arg_strs, inspect(args[i]))
  end
  return string.format(msg, table.unpack(arg_strs))
end

local function fail(msg, ...)
  error(debug.traceback(format(msg, ...)))
end

local function assert(expr, msg, ...)
  if not expr then
    fail(msg, ...)
  end
end

--------------------------------------------------------------------------------

local module = {}

function module.fail(msg, ...)
  fail("assertion failed")
end

function module.assert(expr)
  assert(expr, "assertion failed")
end

function module.eq(expected, actual)
  assert(expected == actual,
         "assertion failed: %s == %s",
         expected, actual)
end

function module.ne(expected, actual)
  assert(expected ~= actual,
         "assertion failed: %s ~= %s",
         expected, actual)
end

function module.type(expected_type, actual_value, ...)
  assert(expected_type == type(actual_value),
         "assertion failed: %s == type(%s)",
         expected_type, actual_value)
end

function module.types(expected_types, actual_value)
  local actual_type = type(actual_value)
  for _, expected_type in pairs(expected_types) do
    if expected_type == actual_type then
      return
    end
  end
  fail("assertion failed: %s == type(%s)",
       expected_types, actual_value)
end

function module.table_eq(expected_value, actual_table, actual_key, ...)
  assert(expected_value == actual_table[actual_key],
         "assertion failed: %s == %s (table:%s, key:%s)",
         expected_value,
         actual_table[actual_key],
         actual_table,
         actual_key)
end

function module.table_ne(expected_value, actual_table, actual_key, ...)
  assert(expected_value ~= actual_table[actual_key],
         "assertion failed: %s ~= %s (table:%s, key:%s)",
         expected_value,
         actual_table[actual_key],
         actual_table,
         actual_key)
end

function module.table_type(expected_type, actual_table, actual_key)
  assert(expected_type == type(actual_table[actual_key]),
         "assertion failed: %s == type(%s) (table:%s, key:%s)",
         expected_type,
         actual_table[actual_key],
         actual_table,
         actual_key)
end

local module_mt = {
  __call = function (_, ...)
    module.assert(...)
  end,
  __index = module,
  __newindex = function ()
    error("Attempt to modify read-only table")
  end,
  __metatable = false,
}

return setmetatable(module, module_mt)
