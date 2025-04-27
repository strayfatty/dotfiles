return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- list of parsers
            ensure_installed = {
                "bash",
                "c",
                "c_sharp",
                "gitignore",
                "graphql",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "rust",
                "typescript",
                "sql",
                "vimdoc",
                "yaml",
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
            auto_install = true,

            indent = {
                enable = true,
            },

            highlight = {
                -- `false` will disable the whole extension
                enable = true,
            },
        })
    end
}
