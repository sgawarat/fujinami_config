local keytable = require "lib.keytable"

-- 日本語キーボードでUS配列を使うためのKeytable
local K = require("keytables.jp109.us104." .. Platform.NAME)
return keytable.new {
  name = "us104",
  model_name = "jp109",
  key_map = K.KEY_MAP,
  alphanumeric_keys = K.ALPHANUMERIC_KEYS,
  non_alphanumeric_keys = K.NON_ALPHANUMERIC_KEYS,
  modifier_keys = K.MODIFIER_KEYS,
}
