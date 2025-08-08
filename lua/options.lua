require "nvchad.options"

-- add yours here!

local opt = vim.opt
local o = vim.o
local g = vim.g
local border = "rounded"

opt.wrap = false
opt.relativenumber = true
opt.autoread = true

_G.transparency_enabled = require("chadrc").base46.transparency

o.shell = "pwsh"

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

-- apply rounded borders to other floating UI elements
vim.diagnostic.config {
  float = { border = border },
}
