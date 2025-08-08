local g = vim.g
local o = vim.o

-- neovide settings
if g.neovide then
  g.neovide_fullscreen = true
  -- g.neovide_opacity = 0.8
  o.guifont = "MesloLGS Nerd Font:h12"
  vim.keymap.set({"i", "c"}, "<C-v>", '<ESC>l"+Pli')

  -- vim.g.neovide_position_animation_length = 0
  -- vim.g.neovide_cursor_animation_length = 0.15
  g.neovide_cursor_trail_size = 0.2
  -- vim.g.neovide_cursor_animate_in_insert_mode = false
  -- vim.g.neovide_cursor_animate_command_line = false
  -- vim.g.neovide_scroll_animation_far_lines = 0
  -- vim.g.neovide_scroll_animation_length = 0.00 
  end
