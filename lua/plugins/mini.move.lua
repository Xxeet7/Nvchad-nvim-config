-- ================================================================================================
-- TITLE : mini.move
-- ABOUT : Neovim Lua plugin to move any selection in any direction. Part of 'mini.nvim' library.
-- LINKS : https://github.com/nvim-mini/mini.move
-- ================================================================================================

return {
  "echasnovski/mini.move",
  version = false,
  -- event = "BufReadPost",
  keys = {
    { "<A-j>" },
    { "<A-k>" },
  },
  config = function()
    require("mini.move").setup {
      mappings = {
        line_left = "",
        line_right = "",
      },
    }
  end,
}
