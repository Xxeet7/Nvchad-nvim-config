return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  config = function()
    require("project_nvim").setup {
      detection_methods = { "pattern", "lsp" },
      patterns = { ".git", "Makefile", "package.json", "Cargo.toml", "composer.json" },
      silent_chdir = true,
      show_hidden = false,
      scope_chdir = "global",

      exclude_dirs = {
        "vendor/",
        "node_modules/",
      },
    }
  end,
}
