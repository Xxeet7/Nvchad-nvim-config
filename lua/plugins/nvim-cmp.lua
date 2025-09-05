-- ================================================================================================
-- TITLE : nvim-cmp
-- ABOUT : A completion plugin for neovim coded in Lua.
-- LINKS : https://github.com/hrsh7th/nvim-cmp
-- ================================================================================================

return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter" },
  dependencies = {
    "zbirenbaum/copilot-cmp",
    {
      "hrsh7th/cmp-cmdline",
      event = "CmdlineEnter",
      config = function()
        local cmp = require "cmp"

        cmp.setup.cmdline("/", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = { { name = "buffer" } },
        })

        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources(
            { { name = "path" } },
            { { name = "cmdline" }, option = {
              ignore_cmds = { "Man", "!" },
            } }
          ),
          matching = { disallow_symbol_nonprefix_matching = false },
        })
      end,
    },
  },
  opts = function(_, opts)
    local cmp = require "cmp"
    table.insert(opts.sources, 1, { name = "copilot" })
    opts.view = {
      docs = {
        auto_open = false,
      },
      entries = {
        -- selection_order = "near_cursor",
      },
    }
    opts.mapping = {
      ["<UP>"] = cmp.mapping.select_prev_item(),
      ["<DOWN>"] = cmp.mapping.select_next_item(),
      ["<Tab>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      -- ["<C-e>"] = cmp.mapping.abort(),
      ["<C-o>"] = function()
        if cmp.visible() then
          cmp.abort()
        else
          cmp.complete()
        end
      end,
      ["<C-f>"] = function()
        if cmp.visible_docs() then
          cmp.close_docs()
        else
          cmp.open_docs()
        end
      end,
    }
    return opts
  end,
}
