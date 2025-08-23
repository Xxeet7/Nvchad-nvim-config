-- options 
require "nvchad.options"

local opt = vim.opt
local o = vim.o
local g = vim.g
local border = "rounded"

-- general options
opt.wrap = false
opt.relativenumber = true
opt.autoread = true

-- global options for transparency
_G.transparency_enabled = require("chadrc").base46.transparency

-- default shell
-- o.shell = "pwsh"

-- wsl related options
-- g.clipboard = {
--   name = "WslClipboard",
--   copy = {
--     €kl["+"]€kl = "clip.exe",
--     ["*"] = "clip.exe",
--   },
--   paste = {
--     ["+"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     ["*"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--   },
--   cache_enabled = 0,
-- }

-- etc
-- apply rounded borders to other floating UI elements
vim.diagnostic.config {
  float = { border = border },
}
