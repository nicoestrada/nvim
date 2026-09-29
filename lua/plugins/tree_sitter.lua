return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "lua",
                "rust",
                "markdown",
                "python",
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        },
    },
}
