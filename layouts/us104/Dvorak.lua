local assert = require "lib.assert"
local layout = require "lib.layout"

return layout.new {
  name = "Dvorak",
  build = function (model, keytable, options)
    local alphanumeric_commands = model:map_to_keys {
      {"`"}, {"1"}, {"2"}, {"3"}, {"4"}, {"5"}, {"6"}, {"7"}, {"8"}, {"9"}, {"0"}, {"["}, {"]"},
      {"'"}, {","}, {"."}, {"p"}, {"y"}, {"f"}, {"g"}, {"c"}, {"r"}, {"l"}, {"/"}, {"="}, {"\\"},
      {"a"}, {"o"}, {"e"}, {"u"}, {"i"}, {"d"}, {"h"}, {"t"}, {"n"}, {"s"}, {"-"},
      {";"}, {"q"}, {"j"}, {"k"}, {"x"}, {"b"}, {"m"}, {"w"}, {"v"}, {"z"},
    }
    local alphanumeric_shift_commands = model:map_to_keys {
      {"~"}, {"!"}, {"@"}, {"#"}, {"$"}, {"%"}, {"^"}, {"&"}, {"*"}, {"("}, {")"}, {"{"}, {"}"},
      {"\""}, {"<"}, {">"}, {"P"}, {"Y"}, {"F"}, {"G"}, {"C"}, {"R"}, {"L"}, {"?"}, {"+"}, {"|"},
      {"A"}, {"O"}, {"E"}, {"U"}, {"I"}, {"D"}, {"H"}, {"T"}, {"N"}, {"S"}, {"_"},
      {":"}, {"Q"}, {"J"}, {"K"}, {"X"}, {"B"}, {"M"}, {"W"}, {"V"}, {"Z"},
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
