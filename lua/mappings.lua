require "nvchad.mappings"
local history_dir = vim.fn.stdpath "data" .. "/copilotchat_history"
local files = vim.fn.glob(history_dir .. "/*.json", false, true)
local map = vim.keymap.set
local wk = require "which-key"
local unmap = vim.keymap.del

--unmappin default nvchad mappings
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
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>") --exit with jk instead of ESC
map("n", "<C-q>", "<cmd>q<CR>", { desc = "general quit vim" })
map({ "n", "i" }, "<C-s>", "<cmd>wa<CR>", { desc = "general save" })

-- which-key grouping
wk.add {
  {
    "<leader>e",
    "<cmd>NvimTreeToggle<CR>",
    desc = "Explorer (Root)",
    mode = "n",
    icon = { icon = "", color = "yellow" },
  },
  {
    "<leader>E",
    "<cmd>lua require('nvim-tree.api').tree.toggle({ path = vim.fn.getcwd() })<CR>",
    desc = "Explorer (CWD)",
    mode = "n",
    icon = { icon = "", color = "yellow" },
  },
  { "<leader>o", group = "open", icon = { icon = "" } },
  { "<leader>c", group = "code", icon = { icon = "", color = "azure" } },
  { "<leader>f", group = "telescope", icon = { icon = "", color = "green" } },
  { "<leader>a", group = "AI", icon = { icon = "", color = "azure" } },
  { "<leader>t", group = "toggle", icon = { icon = "", color = "yellow" } },
  { "<leader>l", group = "LSP", icon = { icon = "󰒍", color = "blue" } },
  { "<leader>w", group = "Workspace", icon = { icon = "", color = "blue" } },
  { "<leader>r", group = "Variables", icon = { icon = "", color = "red" } },
}

-- copilot chat
-- toggle copilot chat
map("n", "<leader>aa", "<cmd>CopilotChatToggle<CR>", { desc = "Open/close Copilot Chat" })
-- open copilot action on highlighted
map("v", "<leader>aa", "<cmd>CopilotChatPrompts<CR>", { desc = "Copilot action for highlighted" })
-- open last copilot session
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

-- Toggle
-- Transparency
map("n", "<leader>tt", ToggleTransparency, { desc = "Toggle Transparency" })
-- Theme switch
map("n", "<leader>ts", function()
  require("base46").toggle_theme()
end, { desc = "toggle switch theme" })

-- file format
map({ "n", "x" }, "<leader>cf", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "format file" })

-- Open Utils buffer
-- Mason
map("n", "<leader>om", "<cmd>Mason<CR>", { desc = "Open Mason" })
-- Nvchad dashboard
map("n", "<leader>on", "<cmd>Nvdash<CR>", { desc = "Open NvDash" })
-- Lazy
map("n", "<leader>ol", "<cmd>Lazy<CR>", { desc = "Open Lazy" })
-- Lazy git
map("n", "<leader>og", function()
  require("lazy.util").float_term({ "lazygit" }, { border = "rounded" })
end, { desc = "Open Lazy git" })
map("n", "<leader>oy", function()
  require("lazy.util").float_term({ "yazi" }, { border = "rounded", cwd = vim.fn.getcwd() })
end, { desc = "Open Yazi file manager" })

-- Telescope
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })

-- NvCheatsheet
map("n", "<leader>tc", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- Nvchad themes
map("n", "<leader>ft", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

-- lsp related
map("n", "K", function()
  vim.lsp.buf.hover { border = "rounded" }
end, { desc = "hover info" })

-- close all buffers
map("n", "<leader>X", function()
  require("nvchad.tabufline").closeAllBufs(true)
end, { desc = "buffer close all" })

