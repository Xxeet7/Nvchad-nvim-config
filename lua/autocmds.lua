require "nvchad.autocmds"
local autocmd = vim.api.nvim_create_autocmd

-- copilot chat buffer options
autocmd("BufEnter", {
  pattern = "copilot-*",
  callback = function()
    -- Set buffer-local options
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.conceallevel = 0
    vim.opt_local.wrap = true
  end,
})

-- open nvchad dashboard when no buffers are open
autocmd("BufDelete", {
  callback = function()
    local bufs = vim.t.bufs
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
    end
  end,
})

-- save cursor position when leaving a buffer
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

-- wezterm padding configuration
-- set wezterm padding to 0 when enter Neovim
autocmd("VimEnter", {
  callback = function()
    _G.SetWeztermUserVar("nvim_padding", "0")
  end,
})

-- Restore padding when Neovim exits
autocmd("VimLeavePre", {
  callback = function()
    _G.SetWeztermUserVar("nvim_padding", "default")
  end,
})

-- check for file changes
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  command = "checktime",
})

-- hihlight on yank
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_yank_group,
	pattern = "*",
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})
