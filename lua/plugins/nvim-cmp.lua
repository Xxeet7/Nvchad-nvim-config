return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter" },
  dependencies = {
    "zbirenbaum/copilot-cmp",
  },
  opts = function(_, opts)
    local cmp = require "cmp"
    -- Insert copilot source at the top
    opts.sources = opts.sources or {}
    table.insert(opts.sources, 1, { name = "copilot" })
    -- Merge/override with your custom cmp options
    opts.view = {
      docs = {
        auto_open = false,
      },
      entries = {
        -- selection_order = "near_cursor",
      }
    }
    opts.window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }
    opts.formatting = {
      expandable_indicator = true
    }
    opts.preselect = cmp.PreselectMode.None
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

