if true then return {} end
return {
  "echasnovski/mini.surround",
  version = false,
  event = "BufReadPost",
  config = function()
    require("mini.surround").setup()
  end,
}
