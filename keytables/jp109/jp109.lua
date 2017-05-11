local keytable = require "lib.keytable"

-- 日本語キーボードでJP配列を使うためのKeytable
local K = require("keytables.jp109.jp109." .. Platform.NAME)
return keytable.new {
  name = "jp109",
  model_name = "jp109",
  key_map = K.KEY_MAP,
  alphanumeric_key_names = K.ALPHANUMERIC_KEY_NAMES,
  non_alphanumeric_key_names = K.NON_ALPHANUMERIC_KEY_NAMES,
  modifier_key_names = K.MODIFIER_KEY_NAMES,
  alphanumeric_keys = K.ALPHANUMERIC_KEYS,
  non_alphanumeric_keys = K.NON_ALPHANUMERIC_KEYS,
  modifier_keys = K.MODIFIER_KEYS,
}
