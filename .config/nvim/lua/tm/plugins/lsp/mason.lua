return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "j-hui/fidget.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_nvim_lsp.default_capabilities())

        mason.setup()

        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "cssls",
                "graphql",
                "html",
                "lua_ls",
                "omnisharp",
                "rust_analyzer",
                "ts_ls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities
                    })
                end,
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "prettier",
                "stylua",
            },
        })
    end
}
