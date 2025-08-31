-- options 
require "nvchad.options"

local opt = vim.opt
local o = vim.o
local g = vim.g
local border = "rounded"

-- global options
_G.transparency_enabled = require("chadrc").base46.transparency
_G.wrap_line = false

-- general options
opt.wrap = _G.wrap_line
opt.linebreak = true
opt.relativenumber = true
opt.autoread = true
opt.scrolloff = 10
opt.termguicolors = true -- Enable 24-bit colors
opt.lazyredraw = false -- redraw while executing macros (butter UX)
opt.redrawtime = 10000 -- Timeout for syntax highlighting redraw
opt.maxmempattern = 20000 -- Max memory for pattern matching
opt.synmaxcol = 300 -- Syntax highlighting column limit

-- File Handling
opt.backup = false -- Don't create backup files
opt.writebackup = false -- Don't backup before overwriting
opt.swapfile = false -- Don't create swap files
opt.undofile = true -- Persistent undo
opt.updatetime = 300 -- Time in ms to trigger CursorHold
opt.timeoutlen = 500 -- Time in ms to wait for mapped sequence
opt.autoread = true -- Auto-reload file if changed outside
opt.autowrite = false -- Don't auto-save on some events
opt.diffopt:append("vertical") -- Vertical diff splits
opt.diffopt:append("algorithm:patience") -- Better diff algorithm
opt.diffopt:append("linematch:60") -- Better diff highlighting (smart line matching)

opt.iskeyword:append("-") -- Treat dash as part of a word

-- default shell
-- o.shell = "pwsh"

-- etc
-- apply rounded borders to other floating UI elements
vim.diagnostic.config {
  float = { border = border },
}
