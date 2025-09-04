-- ================================================================================================
-- TITLE : which-key.nvim
-- ABOUT : Create key bindings that stick. WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.
-- LINKS  : https://github.com/folke/which-key.nvim
-- ================================================================================================

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    win = {
      no_overlap = true,
    },
    icons = {
      group = "",
    },
  },
  config = function()
    wk = require "which-key"
    wk.add {
      {
        "<leader>e",
        desc = "Explorer (Root)",
        icon = { icon = "", color = "yellow" },
      },
      {
        "<leader>E",
        desc = "Explorer (CWD)",
        icon = { icon = "", color = "yellow" },
      },
      {
        "<leader>d",
        desc = "Delete without yanking",
        icon = { icon = "󰗨", color = "red" },
      },
      {
        "<leader>y",
        desc = "yazi",
        icon = { icon = "󰇥", color = "yellow" },
      },
      {
        "<leader>s",
        desc = "split",
        icon = { icon = "", color = "blue" },
      },
      { "<leader>o", group = "open", icon = { icon = "" } },
      { "<leader>c", group = "code", icon = { icon = "", color = "azure" } },
      { "<leader>f", group = "telescope", icon = { icon = "", color = "green" } },
      { "<leader>a", group = "AI", icon = { icon = "", color = "azure" } },
      { "<leader>t", group = "toggle", icon = { icon = "", color = "yellow" } },
      { "<leader>l", group = "LSP", icon = { icon = "󰒍", color = "blue" } },
      { "<leader>w", group = "Workspace", icon = { icon = "", color = "blue" } },
      { "<leader>r", group = "Variables", icon = { icon = "", color = "red" } },
      { "<leader>v", group = "Vim", icon = { icon = "", color = "green" } },
    }
  end,
}
