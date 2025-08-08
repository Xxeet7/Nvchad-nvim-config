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
