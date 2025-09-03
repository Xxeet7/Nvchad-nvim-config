-- ================================================================================================
-- TITLE : Auto-save
-- ABOUT : Auto-save your work when you switch to a different buffer, or after a period of inactivity.
-- LINKS : https://github.com/okuuva/auto-save.nvim
-- ================================================================================================

return {
  "okuuva/auto-save.nvim",
  version = '^1.0.0', -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
  cmd = "ASToggle", -- optional for lazy loading on command
  event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  opts = {
    -- your config goes here
    -- or just leave it empty :)
  },
}
