local inspect = require "lib.inspect"

local function to_string(args)
  local results = {}
  for i = 1, args.n do
    table.insert(results, inspect(args[i]))
  end
  return table.unpack(results)
end

local function assert_impl(expr, s, ...)
  if expr then
    return function (...)
    end
  else
    local s_args = table.pack(...)
    return function (ss, ...)
      if ss then
        local ss_args = table.pack(...)
        error(debug.traceback(string.format(ss, to_string(ss_args))))
      else
        error(debug.traceback(string.format(s, to_string(s_args))))
      end
    end
  end
end

----------

local module = {}

function module.fail(s, ...)
  return assert_impl(false, "assertion failed")(s, ...)
end

function module.assert(expr)
  return assert_impl(expr, "assertion failed")
end

function module.eq(expected, actual)
  return assert_impl(expected == actual,
                     "assertion failed: %s == %s",
                     expected, actual)
end

function module.ne(expected, actual)
  return assert_impl(expected ~= actual,
                     "assertion failed: %s ~= %s",
                     expected, actual)
end

function module.type(expected_type, actual, ...)
  return assert_impl(expected_type == type(actual),
                     "assertion failed: %s == type(%s)",
                     expected_type, actual)
end

function module.table_eq(expected, actual_table, actual_key, ...)
  return assert_impl(expected == actual_table[actual_key],
                     "assertion failed: %s == %s (table:%s, key:%s)",
                     expected, actual_table[actual_key],
                     actual_table,
                     actual_key)
end

function module.table_ne(expected, actual_table, actual_key, ...)
  return assert_impl(expected ~= actual_table[actual_key],
                     "assertion failed: %s ~= %s (table:%s, key:%s)",
                     expected,
                     actual_table[actual_key],
                     actual_table,
                     actual_key)
end

function module.table_type(expected_type, actual_table, actual_key)
  return assert_impl(expected_type == type(actual_table[actual_key]),
                     "assertion failed: %s == type(%s) (table:%s, key:%s)",
                     expected_type,
                     actual_table[actual_key],
                     actual_table,
                     actual_key)
end

function module.table_types(expected_types, actual_table)
  return function (...)
    for arg_name, type_name in pairs(expected_types) do
      module.table_type(type_name, actual_table, arg_name)(...)
    end
  end
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
