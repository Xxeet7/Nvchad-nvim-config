-- ================================================================================================
-- TITLE : nvim-tree
-- ABOUT : A file explorer tree for neovim written in lua
-- LINKS : https://github.com/nvim-tree/nvim-tree.lua
-- ================================================================================================
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', '<leader>sv', api.node.open.vertical, opts('Open file in vertical split'))
  vim.keymap.set('n', '<leader>sh', api.node.open.horizontal, opts('Open file in horizontal split'))
end

return {
  {
    "nvim-tree/nvim-tree.lua",
    -- lazy = false,
    event = "VeryLazy",
    opts = {
      on_attach = my_on_attach,
      -- sync_root_with_cwd = true,
      -- respect_buf_cwd = true,
      -- update_focused_file = {
      --   enable = true,
      --   update_root = true,
      -- },
      view = {
        -- number = true,
        -- relativenumber = true,
        -- side = "right",
        width = 45,
        -- float = {
        --   enable = true,
        --   open_win_config = {
        --     width = 35,
        --     height = 26,
        --     row = 1,
        --     col = 90,
        --   },
        -- },
      },
      actions = {
        open_file = {
          quit_on_open = true, -- close tree when opening a file
        },
      },
      ui = {
        confirm = {
          remove = true, -- confirm before deleting a file
          trash = true, -- confirm before moving to trash
          default_yes = true,
        },
      },
    },
  },
}
