return {
  -- GitHub Copilot (for ghost text)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = true, auto_trigger = true, debounce = 75 },
      panel = { enabled = false },
    },
  },

  -- Copilot LSP (for Next Edit Suggestions)
  {
    "github/copilot.vim",
    event = "VeryLazy",
  },

  -- Sidekick (uses Copilot LSP for NES)
  {
    "folke/sidekick.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      nes = { enabled = true }, 
      cli = {
        mux = {
          backend = "tmux",
          enabled = true,
        },
      },
    },
    keys = {
      {
        "<tab>",
        function()
          if require("sidekick").nes_jump_or_apply() then
            return
          end
          if vim.lsp.inline_completion.get() then
            return
          end
          return "<tab>"
        end,
        mode = { "i", "n" },
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
        { "<leader>at", function() require("sidekick.nes").toggle() end, desc = "Toggle NES" },
        { "<leader>aa", function() require("sidekick.cli").toggle() end, desc = "Toggle AI CLI" },
        { "<leader>as", function() require("sidekick.cli").select() end, desc = "Select CLI" },
        { "<leader>ap", function() require("sidekick.cli").prompt() end, desc = "Prompt" },
        { "<leader>af", function() require("sidekick.cli").send({ msg = "{file}" }) end, desc = "Send File" },
        { "<leader>av", function() require("sidekick.cli").send({ msg = "{selection}" }) end, mode = "x", desc = "Send Visual Selection" },
        { "<C-l>", function() require("sidekick.cli").toggle() end, mode = { "n", "t", "i", "x" }, desc = "Toggle Sidekick Terminal" },
        },
  },
}
