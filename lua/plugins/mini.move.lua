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
