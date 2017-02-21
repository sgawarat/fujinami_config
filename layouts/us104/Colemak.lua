local assert = require "lib.assert"
local layout = require "lib.layout"

return layout.new {
  name = "Colemak",
  build = function (model, keytable, options)
    local alphanumeric_commands = model:map_to_keys {
      {"`"}, {"1"}, {"2"}, {"3"}, {"4"}, {"5"}, {"6"}, {"7"}, {"8"}, {"9"}, {"0"}, {"-"}, {"="},
      {"q"}, {"w"}, {"f"}, {"p"}, {"g"}, {"j"}, {"l"}, {"u"}, {"y"}, {";"}, {"["}, {"]"}, {"\\"},
      {"a"}, {"r"}, {"s"}, {"t"}, {"d"}, {"h"}, {"n"}, {"e"}, {"i"}, {"o"}, {"'"},
      {"z"}, {"x"}, {"c"}, {"v"}, {"b"}, {"k"}, {"m"}, {","}, {"."}, {"/"},
    }
    local alphanumeric_shift_commands = model:map_to_keys {
      {"~"}, {"!"}, {"@"}, {"#"}, {"$"}, {"%"}, {"^"}, {"&"}, {"*"}, {"("}, {")"}, {"_"}, {"+"},
      {"Q"}, {"W"}, {"F"}, {"P"}, {"G"}, {"J"}, {"L"}, {"U"}, {"Y"}, {":"}, {"{"}, {"}"}, {"|"},
      {"A"}, {"R"}, {"S"}, {"T"}, {"D"}, {"H"}, {"N"}, {"E"}, {"I"}, {"O"}, {"\""},
      {"Z"}, {"X"}, {"C"}, {"V"}, {"B"}, {"K"}, {"M"}, {"<"}, {">"}, {"?"},
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
