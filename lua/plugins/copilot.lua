-- ================================================================================================
-- TITLE : copilot
-- ABOUT : Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot
-- LINKS : https://github.com/zbirenbaum/copilot.lua
-- ================================================================================================

return {
  "zbirenbaum/copilot.lua",
  -- event = "VeryLazy",
  cmd = "Copilot",
  opts = {
    suggestion = {
      enabled = false,
    },
    panel = {
      enabled = false,
    },
  },
}
