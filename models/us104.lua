local model = require "lib.model"

local M = require("models.en104." .. Platform.NAME)
return model.new {
  name = "en104",
  actions_map = M.ACTIONS_MAP,
}
