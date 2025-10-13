return {
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nightfox").setup({
                options = {
                        compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                        compile_file_suffix = "_compiled",
                        transparent = true,
                        terminal_colors = true,
                        dim_inactive = false,
                        module_default = true,
                        styles = {
                            comments = "italic",
                            keywords = "bold",
                        },
                },
            })
            vim.cmd([[colorscheme carbonfox]])
        end,
    },
}
