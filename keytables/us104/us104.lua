local keytable = require "lib.keytable"

local K = require("keytables.us109.us104." .. Platform.NAME)
return keytable.new {
  name = "us104",
  model_name = "us104",
  key_map = K.KEY_MAP,
  alphanumeric_keys = K.ALPHANUMERIC_KEYS,
  non_alphanumeric_keys = K.NON_ALPHANUMERIC_KEYS,
  modifier_keys = K.MODIFIER_KEYS,
}
