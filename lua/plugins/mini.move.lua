return {
  "echasnovski/mini.move",
  version = false,
  event = "BufReadPost",
  config = function()
    require("mini.move").setup {
      mappings = {
        line_left = "",
        line_right = "",
      },
    }
  end,
}
