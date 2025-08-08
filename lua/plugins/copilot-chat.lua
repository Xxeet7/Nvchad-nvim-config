return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      -- { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
      -- { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    opts = {
      -- See Configuration section for options
      window = {
        layout = "vertical",
        width = 0.4,
        height = 0.4,
      },
      callback = function()
        require("CopilotChat").save(os.date("%m-%d"))
      end,
      -- auto_insert_mode = true,
      insert_at_end = true,
      -- question_header = "  User ",
      -- answer_header = "  Copilot ",
      -- error_header = "  Copilot Error ",

      -- headers = {
      --   user = "  [User] ",
      --   copilot = "  [Copilot] ",
      --   tool = " [Tool] ",
      -- },
      separator = "==",
      log_level = 'error',
      prompts = {
        refactor = {
          prompt = "Refactor this selected code.",
          description = "Refactor the code.",
        },
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
    cmd = {
      "CopilotChatToggle",
      "CopilotChatPrompts",
    },
  },
}
