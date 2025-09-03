-- ================================================================================================
-- TITLE : LSP Configuration
-- ================================================================================================

require("nvchad.configs.lspconfig").defaults()

local servers = {
  intelephense = {
    filetypes = { "php" },
  },
  tsserver = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    cmd = { "typescript-language-server", "--stdio" },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name) -- nvim v0.11.0 or above required
  vim.lsp.config(name, opts) -- nvim v0.11.0 or above required
end

-- read :h vim.lsp.config for changing options of lsp servers
