-- ================================================================================================
-- TITLE : Chadrc Configuration
-- ================================================================================================

-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

-- base46 configuration
M.base46 = {
  theme = "horizon",
  transparency = false,
  theme_toggle = { "horizon", "github_light" },
  hl_override = {
    -- NvDashButtons = { fg = "purple" },
    NvDashAscii = { fg = "green" },
  },
  hl_add = {
    transparencyToggle = { bg = "blue", fg = "NONE", reverse = false },
    tabuflineArrowsPrev = { fg = "grey_fg2", bold = true },
    tabuflineArrowsNext = { fg = "grey_fg2", bold = true },
  },
}

-- nvdash configuration
M.nvdash = {
  load_on_startup = true,
  buttons = {
    { txt = "󰒓  config", keys = "c", cmd = "lua require('nvim-tree.api').tree.toggle({path = vim.fn.stdpath('config')})" },
    { txt = "󰈙  find files", keys = "f", cmd = "lua require('telescope.builtin').find_files()" },
    { txt = "󰈹  recent project", keys = "r", cmd = "lua require'telescope'.extensions.projects.projects{}" },
    { txt = "󰓃  help docs", keys = "h", cmd = "lua require('telescope.builtin').help_tags()" },
    {
      txt = "󰇥  yazi",
      keys = "y",
      cmd = "Yazi cwd",
    },
    { txt = "󰓷  Lazy", keys = "l", cmd = "Lazy" },
    { txt = "  quit", keys = "q", cmd = "q" },
    -- { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    -- {
    --   txt = function()
    --     local stats = require("lazy").stats()
    --     local ms = math.floor(stats.startuptime) .. " ms"
    --     return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
    --   end,
    --   hl = "LazyReasonEvent",
    --   no_gap = true,
    -- },
    -- { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

-- ui configuration
M.ui = {
  -- telescope
  telescope = {
    style = "bordered",
  },
  -- cmp
  cmp = {
    style = "atom",
    icons_left = true,
  },
  -- statusline
  statusline = {
    theme = "minimal",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      -- copilot = function()
      --   return require("copilot.status").data.status
      -- end,
    },
  },
  -- tabufline
  tabufline = {
    lazyload = false,
    order = { "buffers", "tabs", "arrowsPrev", "arrowsNext", "transparencyToggle", "btns" },
    modules = {
      transparencyToggle = function()
       return "%@v:lua.ToggleTransparency@%#transparencyToggle# " .. (_G.transparency_enabled and "" or "") .. " "
      end,
      arrowsPrev = function()
        local bufs = vim.t.bufs

        if #bufs <= 1 then
          return ""
        else
          return "%#tabuflineArrowsPrev#" .. "%@v:lua.TabuflinePrev@" .. "  " .. "%X"
        end
      end,
      arrowsNext = function()
        local bufs = vim.t.bufs

        if #bufs <= 1 then
          return ""
        else
          return "%#tabuflineArrowsNext#" .. "%@v:lua.TabuflineNext@" .. "  " .. "%X"
        end
      end,
    },
  },
}

-- lsp configuration
M.lsp = {
  -- signature = false,
}

-- terminal configuration
M.term = {
  sizes = {
    vsp = 0.3,
  },
  float = {
    row = 0,
    col = 0,
    width = 0.9,
    height = 0.87,
    border = "rounded",
  },
}

return M
