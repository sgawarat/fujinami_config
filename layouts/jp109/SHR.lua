local edit_commands = {
    {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {},
    {}, {}, {}, {}, {}, {}, {"CapsLock"}, {"Home"}, {"Ctrl+Left"}, {"Ctrl+Right"}, {"End"}, {"PageUp"},
    {"Ctrl+Backspace"}, {"Backspace"}, {"Delete"}, {"Ctrl+Delete"}, {"Ctrl+d"}, {}, {"Left"}, {"Down"}, {"Up"}, {"Right"}, {"Ctrl+Enter"}, {"PageDown"},
    {"Ctrl+z"}, {"Ctrl+x"}, {"Ctrl+c"}, {"Ctrl+v"}, {}, {}, {}, {""}, {""}, {""}, {""},
}

local function build_layout(t)
  return {
    simul_key_flows {
      key_lists = t.keytable.alphanumeric_key_lists,
    },
    simul_key_flows {
      key_lists = {
        t.left_thumb_key_list,
        t.right_thumb_key_list,
        t.left_edit_key_list,
        t.right_edit_key_list,
      }
    },
    immediate_key_flows {
      key_lists = t.keytable.non_alphanumeric_key_lists,
    },
    immediate_key_flows {
      key_lists = t.keytable.modifier_key_lists,
    },
    simple_mappings {
      trigger_key_lists = t.keytable.alphanumeric_key_lists,
      modifier_key_lists = t.keytable.modifier_key_lists,
      commands = t.alphanumeric_commands,
      shift_commands = t.alphanumeric_shift_commands,
      cao_commands = t.cao_alphanumeric_commands,
      cao_shift_commands = t.cao_alphanumeric_shift_commands,
    },
    extended_mappings {
      trigger_key_lists = t.keytable.alphanumeric_key_lists,
      shift_key_list = {t.left_thumb_key_list, t.left_thumb_key_role},
      modifier_key_lists = t.keytable.modifier_key_lists,
      commands = t.left_thumb_commands,
      shift_key_command = t.left_thumb_key_command,
    },
    extended_mappings {
      trigger_key_lists = t.keytable.alphanumeric_key_lists,
      shift_key_list = {t.right_thumb_key_list, t.right_thumb_key_role},
      modifier_key_lists = t.keytable.modifier_key_lists,
      commands = t.right_thumb_commands,
      shift_key_command = t.right_thumb_key_command,
    },
    extended_mappings {
      trigger_key_lists = t.keytable.alphanumeric_key_lists,
      shift_key_list = {t.left_edit_key_list, t.left_edit_key_role},
      modifier_key_lists = t.keytable.modifier_key_lists,
      commands = t.left_edit_commands,
      shift_key_command = t.left_edit_key_command,
    },
    extended_mappings {
      trigger_key_lists = t.keytable.alphanumeric_key_lists,
      shift_key_list = {t.right_edit_key_list, t.right_edit_key_role},
      modifier_key_lists = t.keytable.modifier_key_lists,
      commands = t.right_edit_commands,
      shift_key_command = t.right_edit_key_command,
    },
    simple_mappings {
      trigger_key_lists = t.keytable.non_alphanumeric_key_lists,
      modifier_key_lists = t.keytable.modifier_key_lists,
      commands = t.model.non_alphanumeric_commands,
    },
    modifiers_mappings {
      modifier_key_lists = t.keytable.modifier_key_lists,
    },
  }
end

return {
  build_layout = build_layout,

  -- QWERTY_COMMANDS = {
  --   {"1"}, {"2"}, {"3"}, {"4"}, {"5"}, {"\\|"}, {"6"}, {"7"}, {"8"}, {"9"}, {"0"}, {"-"}, {"^"},
  --   {"q"}, {"w"}, {"e"}, {"r"}, {"t"}, {"["}, {"y"}, {"u"}, {"i"}, {"o"}, {"p"}, {"@"},
  --   {"a"}, {"s"}, {"d"}, {"f"}, {"g"}, {"]"}, {"h"}, {"j"}, {"k"}, {"l"}, {";"}, {":"},
  --   {"z"}, {"x"}, {"c"}, {"v"}, {"b"}, {"\\_"}, {"n"}, {"m"}, {","}, {"."}, {"/"},
  -- },
  QWERTY_COMMANDS = {
    {"1"}, {"2"}, {"3"}, {"4"}, {"5"}, {"\\|"}, {"6"}, {"7"}, {"8"}, {"9"}, {"0"}, {"-"}, {"^"},
    {"q"}, {"w"}, {"e"}, {"r"}, {"t"}, {"@"}, {"y"}, {"u"}, {"i"}, {"o"}, {"p"}, {"["},
    {"a"}, {"s"}, {"d"}, {"f"}, {"g"}, {"]"}, {"h"}, {"j"}, {"k"}, {"l"}, {";"}, {":"},
    {"z"}, {"x"}, {"c"}, {"v"}, {"b"}, {"\\_"}, {"n"}, {"m"}, {","}, {"."}, {"/"},
  },
  QWERTY_SHIFT_COMMANDS = {
    {"!"}, {"\""}, {"#"}, {"$"}, {"%"}, {"|"}, {"&"}, {"'"}, {"("}, {")"}, {"Shift+0"}, {"="}, {"~"},
    {"Q"}, {"W"}, {"E"}, {"R"}, {"T"}, {"`"}, {"Y"}, {"U"}, {"I"}, {"O"}, {"P"}, {"{"},
    {"A"}, {"S"}, {"D"}, {"F"}, {"G"}, {"}"}, {"H"}, {"J"}, {"K"}, {"L"}, {"+"}, {"*"},
    {"Z"}, {"X"}, {"C"}, {"V"}, {"B"}, {"_"}, {"N"}, {"M"}, {"<"}, {">"}, {"?"},
  },
  COLEMAK_COMMANDS = {
    {"1"}, {"2"}, {"3"}, {"4"}, {"5"}, {}, {"6"}, {"7"}, {"8"}, {"9"}, {"0"}, {"["}, {"]"},
    {"q"}, {"w"}, {"f"}, {"p"}, {"g"}, {}, {"j"}, {"l"}, {"u"}, {"y"}, {";"}, {"'"},
    {"a"}, {"r"}, {"s"}, {"t"}, {"d"}, {}, {"h"}, {"n"}, {"e"}, {"i"}, {"o"}, {"_"},
    {"z"}, {"x"}, {"c"}, {"v"}, {"b"}, {}, {"k"}, {"m"}, {","}, {"."}, {"/"},
  },
  COLEMAK_SHIFT_COMMANDS = {
    {"!"}, {"@"}, {"#"}, {"$"}, {"%"}, {}, {"^"}, {"&"}, {"*"}, {"("}, {")"}, {"{"}, {"}"},
    {"Q"}, {"W"}, {"F"}, {"P"}, {"G"}, {}, {"J"}, {"L"}, {"U"}, {"Y"}, {":"}, {"\""},
    {"A"}, {"R"}, {"S"}, {"T"}, {"D"}, {}, {"H"}, {"N"}, {"E"}, {"I"}, {"O"}, {"-"},
    {"Z"}, {"X"}, {"C"}, {"V"}, {"B"}, {}, {"K"}, {"M"}, {"<"}, {">"}, {"?"},
  },
-- local left_thumb_commands = model:map_to_keys {
--   {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {},
--   {"%"}, {"-", "-"}, {"+", "+"}, {"["}, {"`"}, {}, {}, {}, {"|", "|", "="}, {"&", "&", "="}, {}, {},
--   {"="}, {"*"}, {"{"}, {"("}, {"<", "<"}, {}, {">", ">", "="}, {}, {}, {"&", "="}, {"=", "="}, {"~", "="},
--   {"!"}, {"/"}, {"-"}, {"+"}, {}, {}, {}, {"|", "="}, {"<", "="}, {">", "="}, {"^", "="}
-- }
-- local right_thumb_commands = model:map_to_keys {
--   {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {},
--   {"%", "="}, {}, {}, {"[", "]"}, {"`", "`"}, {}, {"#"}, {"]"}, {"|", "|"}, {"&", "&"}, {"\\"}, {":", ":"},
--   {"=", "="}, {"*", "="}, {"{", "}"}, {"(", ")"}, {"<", "<", "="}, {}, {">", ">"}, {")"}, {"}"}, {"&"}, {"="}, {"~"},
--   {"!", "="}, {"/", "="}, {"-", "="}, {"+", "="}, {}, {}, {}, {"|"}, {"=", ">"}, {"-", ">"}, {"^"}
-- }
  LEFT_THUMB_COMMANDS = {
    {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {},
    {"%"}, {"-", "-"}, {"+", "+"}, {"\\"}, {}, {}, {}, {"`", "`"}, {"|", "|", "="}, {"&", "&", "="}, {":", "="}, {"$", "$"},
    {"="}, {"*"}, {"{"}, {"("}, {}, {}, {}, {}, {}, {"&", "="}, {"=", "="}, {"~", "="},
    {"!"}, {"-"}, {"+"}, {"["}, {}, {}, {}, {"<", ">"}, {"|", "="}, {"=", ">"}, {"^", "="}
  },
  RIGHT_THUMB_COMMANDS = {
    {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {},
    {"%", "="}, {}, {}, {}, {"\\", "\\"}, {}, {}, {"`"}, {"|", "|"}, {"&", "&"}, {":", ":"}, {"$"},
    {"=", "="}, {"*", "="}, {"{", "}"}, {"(", ")"}, {}, {}, {}, {")"}, {"}"}, {"&"}, {"="}, {"~"},
    {"!", "="}, {"-", "="}, {"+", "="}, {"[", "]"}, {}, {}, {"Space"}, {"]"}, {"|"}, {"-", ">"}, {"^"}
  },
  LEFT_EDIT_COMMANDS = edit_commands,
  RIGHT_EDIT_COMMANDS = edit_commands,
}

