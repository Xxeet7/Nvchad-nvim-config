-- Global functions

local g = vim.g

-- flash highlight for a defined highlight group
function _G.FlashHighlight(group, newhl, timeout)
  local ok, oldhl = pcall(vim.api.nvim_get_hl, 0, { name = group })
  if not ok then
    return
  end

  vim.api.nvim_set_hl(0, group, newhl)

  vim.defer_fn(function()
    vim.api.nvim_set_hl(0, group, oldhl)
  end, timeout or 200)
end

-- Toggle transparency
function _G.ToggleTransparency()
  if g.neovide then
    g.neovide_opacity = _G.transparency_enabled and 0.9 or 1.0
  end

  _G.transparency_enabled = not _G.transparency_enabled
  require("base46").toggle_transparency()
end

-- tabufline navigation functions
function _G.TabuflineNext()
  require("nvchad.tabufline").next()
  FlashHighlight("tabuflineArrowsNext", { fg = "white" })
end

function _G.TabuflinePrev()
  require("nvchad.tabufline").prev()
  FlashHighlight("tabuflineArrowsPrev", { fg = "white" })
end

-- modify wezterm user variables
function _G.SetWeztermUserVar(name, value)
  local ty = type(value)

  if ty == "table" then
    value = vim.json.encode(value)
  elseif ty == "function" or ty == "thread" then
    error("cannot serialize " .. ty)
  elseif ty == "boolean" then
    value = value and "true" or "false"
  elseif ty == "nil" then
    value = ""
  end

  local template = "\x1b]1337;SetUserVar=%s=%s\a"
  local command = template:format(name, vim.base64.encode(tostring(value)))
  vim.api.nvim_chan_send(vim.v.stderr, command)
end

function _G.ToggleWrap()
  if _G.wrap_line then
    vim.opt.wrap = false
    _G.wrap_line = false
  else
    vim.opt.wrap = true
    _G.wrap_line = true
  end
end
