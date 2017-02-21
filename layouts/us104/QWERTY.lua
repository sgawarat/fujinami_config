local assert = require "lib.assert"
local layout = require "lib.layout"

return layout.new {
  name = "QWERTY",
  build = function (model, keytable, options)
    local alphanumeric_commands = model:map_to_keys {
      {"`"}, {"1"}, {"2"}, {"3"}, {"4"}, {"5"}, {"6"}, {"7"}, {"8"}, {"9"}, {"0"}, {"-"}, {"="},
      {"q"}, {"w"}, {"e"}, {"r"}, {"t"}, {"y"}, {"u"}, {"i"}, {"o"}, {"p"}, {"["}, {"]"}, {"\\"},
      {"a"}, {"s"}, {"d"}, {"f"}, {"g"}, {"h"}, {"j"}, {"k"}, {"l"}, {";"}, {"'"},
      {"z"}, {"x"}, {"c"}, {"v"}, {"b"}, {"n"}, {"m"}, {","}, {"."}, {"/"},
    }
    local alphanumeric_shift_commands = model:map_to_keys {
      {"~"}, {"!"}, {"@"}, {"#"}, {"$"}, {"%"}, {"^"}, {"&"}, {"*"}, {"("}, {")"}, {"_"}, {"+"},
      {"Q"}, {"W"}, {"E"}, {"R"}, {"T"}, {"Y"}, {"U"}, {"I"}, {"O"}, {"P"}, {"{"}, {"}"}, {"|"},
      {"A"}, {"S"}, {"D"}, {"F"}, {"G"}, {"H"}, {"J"}, {"K"}, {"L"}, {":"}, {"\""},
      {"Z"}, {"X"}, {"C"}, {"V"}, {"B"}, {"N"}, {"M"}, {"<"}, {">"}, {"?"},
    }

    return {
      immediate_key_flows {
        key_lists = {
          keytable.alphanumeric_keys,
          keytable.non_alphanumeric_keys,
          keytable.modifier_keys,
        }
      },
      simple_mappings {
        keys = keytable.alphanumeric_keys,
        commands = alphanumeric_commands,
        shift_commands = alphanumeric_shift_commands,
      },
      passthrough_mappings {
        keys = keytable.non_alphanumeric_keys,
      },
      modifiers_mappings {},
    }
  end
}
