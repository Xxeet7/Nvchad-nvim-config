-- ================================================================================================
-- TITLE : mini.surround
-- ABOUT : Neovim Lua plugin with fast and feature-rich surround actions. Part of 'mini.nvim' library.
-- LINKS : https://github.com/nvim-mini/mini.surround
-- ================================================================================================

if true then return {} end
return {
  "echasnovski/mini.surround",
  version = false,
  event = "BufReadPost",
  config = function()
    require("mini.surround").setup()
  end,
}
