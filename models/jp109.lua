local model = require "lib.model"

local M = require("models.jp109." .. Platform.NAME)
return model.new {
  name = "jp109",
  actions_map = M.ACTIONS_MAP,
}
