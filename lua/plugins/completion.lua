return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        vim.opt.completeopt = { "menu", "menuone", "noselect", }
        vim.opt.shortmess:append "c"

        local lspkind = require "lspkind"
        lspkind.init {}

        local cmp = require "cmp"

        cmp.setup {
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "path" },
            }, {
                { name = "buffer", keyword_length = 3 },
            }),
            mapping = {
                ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
                ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),

                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            }
        }
    end
}
