return {
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    opts = {
      -- sync_root_with_cwd = true,
      -- respect_buf_cwd = true,
      -- update_focused_file = {
      --   enable = true,
      --   update_root = true,
      -- },
      view = {
        -- number = true,
        -- relativenumber = true,
        side = "right",
        width = 35,
        float = {
          enable = true,
          open_win_config = {
            width = 35,
            height = 26,
            row = 1,
            col = 90,
          },
        },
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
