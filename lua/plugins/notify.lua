-- ================================================================================================
-- TITLE : notify
-- ABOUT : A fancy, configurable, notification manager for NeoVim
-- LINKS : https://github.com/rcarriga/nvim-notify
-- ================================================================================================

return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    require("notify").setup {
      background_colour = "NotifyBackground",
      fps = 30,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = "",
      },
      level = 2,
      minimum_width = 30,
      render = "compact",
      stages = "fade_in_slide_out",
      time_formats = {
        notification = "%T",
        notification_history = "%FT%T",
      },
      timeout = 3000,
      top_down = true,
    }
    vim.notify = require "notify"
  end,
  opts = {},
}
