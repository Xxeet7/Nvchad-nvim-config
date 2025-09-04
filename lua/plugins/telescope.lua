-- ================================================================================================
-- TITLE : telescope.nvim
-- ABOUT : Find, Filter, Preview, Pick. All lua, all the time.
-- LINKS : https://github.com/nvim-telescope/telescope.nvim
-- ================================================================================================

local function opts(desc)
  return { desc = " " .. desc, noremap = true, silent = true, nowait = true }
end
local action = require "telescope.actions"

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    extensions_list = { "themes", "terms", "projects" },
    extensions = {},
    defaults = {
      mappings = {
        n = {
          ["<leader>sh"] = {
            action.select_horizontal,
            type = "action",
            opts = opts "Open file in horizontal split",
          },
          ["<leader>sv"] = {
            action.select_vertical,
            type = "action",
            opts = opts "Open file in vertical split",
          },
        },
      },
      file_ignore_patterns = {
        "node_modules",
        ".git",
        "vendor",
      },
    },
  },
}
