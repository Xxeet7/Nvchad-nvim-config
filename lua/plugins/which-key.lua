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
      no_overlap = false,
    },
    icons = {
      group = "",
    }
  }
}
