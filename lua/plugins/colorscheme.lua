return {
  {
    "blazkowolf/gruber-darker.nvim",
    lazy = false,        -- load immediately
    priority = 1000,     -- ensure it loads before other plugins
    opts = {
      bold = false,      -- example customization
      italic = {
        strings = false, -- disable italics for strings
      },
    },
    config = function(_, opts)
      require("gruber-darker").setup(opts)
      vim.cmd.colorscheme("gruber-darker")
    end,
  },
}
