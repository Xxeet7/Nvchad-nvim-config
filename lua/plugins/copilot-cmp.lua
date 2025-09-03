-- ================================================================================================
-- TITLE : copilot-cmp
-- ABOUT : Lua plugin to turn github copilot into a cmp source
-- LINKS : https://github.com/zbirenbaum/copilot-cmp
-- ================================================================================================

return {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = {
    "zbirenbaum/copilot.lua",
  },
  config = function()
    require("copilot_cmp").setup()
  end,
}
