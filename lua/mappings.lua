-- ================================================================================================
-- TITLE : Keymappings
-- ================================================================================================

require "nvchad.mappings"
local history_dir = vim.fn.stdpath "data" .. "/copilotchat_history"
local files = vim.fn.glob(history_dir .. "/*.json", false, true)
local map = vim.keymap.set
local unmap = vim.keymap.del

--unmappin default nvchad mappings
-- needed for changing default
unmap("n", "<leader>n") --line number
unmap("n", "<leader>b") --new buffer
unmap("n", "<leader>rn") --relative number
unmap("n", "<leader>h") --horizontal term
unmap("n", "<leader>v") --vertical term
unmap("n", "<leader>pt") --telescope list terminal
unmap("n", "<leader>ma") --find mark
unmap("n", "<leader>gt") --git status
unmap("n", "<leader>ds") --lsp doc
unmap("n", "<leader>cm") --find commit
unmap("n", "<leader>ch") --old Nvcheatsheet map
unmap("n", "<leader>th") --old Nvchad theme map

-- general mappings
map({ "n", "v" }, ";", ":", { desc = "CMD enter command mode" }) -- ";" to ":"
map("i", "jk", "<ESC>") -- easy exit insert mode
map("n", "<C-q>", "<cmd>q<CR>", { desc = "general quit vim" }) -- quit
map({ "n", "i" }, "<C-s>", "<cmd>w<CR>", { desc = "general save" }) -- save
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "hover info" }) -- lsp Hover info
map("n", "<leader>X", "<cmd>lua require('nvchad.tabufline').closeAllBufs(true)<CR>", { desc = "buffer close all" }) -- close all buffers
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" }) -- delete without yanking
map({ "n", "v" }, "c", '"_c', { desc = "Replace/Change without yanking" }) -- make "c" not yanking by default
map("n", "C", '"_C', { desc = "Replace/Change to end without yanking" }) -- same

-- nvim tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Explorer (Root)" })
map(
  "n",
  "<leader>E",
  "<cmd>lua require('nvim-tree.api').tree.toggle({ path = vim.fn.getcwd() })<CR>",
  { desc = "Explorer (CWD)" }
)

-- copilot chat
map("n", "<leader>aa", "<cmd>CopilotChatToggle<CR>", { desc = "Open/close Copilot Chat" })
map("v", "<leader>aa", "<cmd>CopilotChatPrompts<CR>", { desc = "Copilot action for highlighted" })
map("n", "<leader>ar", function()
  table.sort(files, function(a, b)
    return a > b
  end)
  if #files > 0 then
    local latest = vim.fn.fnamemodify(files[1], ":t:r")
    require("CopilotChat").load(latest)
    require("CopilotChat").open()
  else
    vim.notify("No CopilotChat sessions found.", vim.log.levels.WARN)
  end
end, { desc = "Open last copilot session" })

-- Toggle terminal <ALT>
map(
  { "n", "t" },
  "<A-g>",
  "<cmd>lua require('nvchad.term').toggle { pos = 'float', id = 'geminiterm', cmd = 'gemini' }<CR>",
  { desc = "open/close gemini term" }
) -- gemini cli (alt-g)
map(
  { "n", "t" },
  "<A-I>",
  "<cmd>FloatermToggle<CR>",
  { desc = "open/close Terminal Hub" }
) -- Terminal Hub (alt-I) <- big I


-- Toggle Utils
map("n", "<leader>tt", ToggleTransparency, { desc = "Toggle Transparency" }) -- Transparency
map("n", "<leader>ts", "<cmd>lua require('base46').toggle_theme()<CR>", { desc = "toggle switch theme" }) -- Theme switch
map("n", "<leader>tk", "<cmd>ShowkeysToggle<CR>", { desc = "Toggle show Keystroke" }) -- Show keystroke
map("n", "<leader>tw", ToggleWrap, { desc = "toggle wrap line" }) -- Wrap line

-- Code format
map(
  { "n", "x" },
  "<leader>cf",
  " <cmd>lua require('conform').format { lsp_fallback = true, async = true }<CR>",
  { desc = "format file" }
)

-- Open Utils buffer
map("n", "<leader>om", "<cmd>Mason<CR>", { desc = "Open Mason" }) -- Mason
map("n", "<leader>on", "<cmd>Nvdash<CR>", { desc = "Open NvDash" }) -- Nvchad dashboard
map("n", "<leader>ol", "<cmd>Lazy<CR>", { desc = "Open Lazy" }) -- Lazy
map(
  "n",
  "<leader>og",
  "<cmd>lua require('lazy.util').float_term({ 'lazygit' }, { border = 'rounded' })<CR>",
  { desc = "Open Lazy git" }
) -- Lazy git
map("n", "<leader>oc", "<cmd>NvCheatsheet<CR>", { desc = "open nvcheatsheet" }) --NvCheatsheet

-- Telescope (find)
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "telescope find keymaps" })
map("n", "<leader>fc", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden console (term)" })
map("n", "<leader>ft", "<cmd>lua require('nvchad.themes').open()<CR>", { desc = "telescope nvchad themes" }) -- Nvchad themes

-- vim commands
map("n", "<leader>vs", "<cmd>suspend<CR>", { desc = "vim suspend" })
map("n", "<leader>vw", "<cmd>w<CR>", { desc = "vim write (save)" })
map("n", "<leader>vq", "<cmd>q<CR>", { desc = "vim quit" })
map("n", "<leader>vQ", "<cmd>q!<CR>", { desc = "vim force quit" })

-- center screen when jumping
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Better indenting in visual mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Splitting & Resizing
map("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>sh", "<Cmd>split<CR>", { desc = "Split window horizontally" })
map("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<Cmd>vertical resize +2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<Cmd>vertical resize -2<CR>", { desc = "Increase window width" })

-- Nvmenu (right click menu)
map({ "n", "v", "i" }, "<RightMouse>", function()
  require("menu.utils").delete_old_menus()

  vim.cmd.exec '"normal! \\<RightMouse>"'

  -- clicked buf
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

  require("menu").open(options, { mouse = true })
end, {})
