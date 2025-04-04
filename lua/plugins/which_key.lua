return {	
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
        "echasnovski/mini.icons",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        preset = "modern",
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.add({
            { "<leader>n", group = "navigate" },
            { "<leader>nn", "<cmd>Ex<cr>", desc = "Open Netrw Explorer", mode = "n" },
            { "<leader>n,", "<cmd>bnext<cr>", desc = "Next Buffer", mode = "n" },
            { "<leader>nm", "<cmd>bprev<cr>", desc = "Previous Buffer", mode = "n" },
        })
    end,
}
