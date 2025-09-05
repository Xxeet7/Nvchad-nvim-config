-- ================================================================================================
-- TITLE : LSP Configuration
-- ================================================================================================

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"
local map = vim.keymap.set

local on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "<leader>lI", "<cmd>Telescope lsp_implementations<CR>", opts "Go to implementation")
  map("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", opts "Go to definition")
  map("n", "<leader>lD", "<cmd>Telescope lsp_type_definitions<CR>", opts "Go to type definition")
  map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", opts "list symbols (var, function, etc.) in buffer")
  map(
    "n",
    "<leader>lS",
    "<cmd>Telescope lsp_workspace_symbols<CR>",
    opts "list symbols (var, function, etc.) in workspace"
  )
  map("n", "<leader>lR", "<cmd>Telescope lsp_references<CR>", opts "show references")

  map("n", "<leader>lr", require "nvchad.lsp.renamer", opts "Variable rename")
end

-- Server-specific configurations
-- These will be merged with the common_opts
local servers = {
  lua_ls = {
    filetypes = { "lua" },
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        workspace = {
          library = {
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
            vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
            "${3rd}/luv/library",
          },
        },
      },
    },
  },
  html = {
    filetypes = { "html" },
  },
  cssls = {
    filetypes = { "css" },
  },
  intelephense = {
    filetypes = { "php" },
  },
  ts_ls = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  -- Add other servers here, for example:
  -- pyright = {},
  -- rust_analyzer = {},
}

-- Loop through servers and set them up
for name, server_opts in pairs(servers) do
  local final_opts = vim.tbl_deep_extend("force", {}, {
    on_attach = on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }, server_opts)

  lspconfig[name].setup(final_opts)
end

-- for Nvchad diagnostic configuration
dofile(vim.g.base46_cache .. "lsp")
require("nvchad.lsp").diagnostic_config()

-- read :h vim.lsp.config for changing options of lsp servers
