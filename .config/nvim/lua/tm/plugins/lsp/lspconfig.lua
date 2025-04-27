return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }

                opts.desc = "Code action"
                vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)

                opts.desc = "Smart rename"
                vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)

                opts.desc = "Show LSP definitions"
                vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)

                opts.desc = "Show LSP references"
                vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)

                opts.desc = "Show LSP implementations"
                vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)

                opts.desc = "Show LSP type definitions"
                vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts)

                opts.desc = "Show documentation"
                vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, opts)

                opts.desc = "Show diagnostics"
                vim.keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics<cr>", opts)

                opts.desc = "Show buffer diagnostics"
                vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)
            end
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = true,
                header = "",
                prefix = "",
            },
        })
    end
}
