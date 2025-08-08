local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    php = { "pint" },
    javascript = { "prettier" },
  },
  formatters = {
    pint = function()
      local pint_config = vim.fn.stdpath "config" .. "\\other\\pint.json"
      return {
        command = "pint",
        args = { "$FILENAME", "--silent", "--config=" .. pint_config },
      }
    end,
    prettier = {
      command = "prettier",
      args = { "-w", "$FILENAME" },
      stdin = false,
    },
  },
  -- log_level = vim.log.levels.DEBUG,
}

return options
