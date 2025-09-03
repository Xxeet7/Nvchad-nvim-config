-- ================================================================================================
-- TITLE : telescope.nvim
-- ABOUT : Find, Filter, Preview, Pick. All lua, all the time.
-- LINKS : https://github.com/nvim-telescope/telescope.nvim
-- ================================================================================================

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    extensions_list = { "themes", "terms", "projects" },
    extensions = {},
    defaults = {
      file_ignore_patterns = {
        "node_modules",
        ".git",
        "vendor",
      },
    },
  },
}
