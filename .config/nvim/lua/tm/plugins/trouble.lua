return {
    "folke/trouble.nvim",
    opts = {
        modes = {
            diagnostics = {
                preview = {
                    type = "split",
                    relative = "win",
                    position = "right",
                    size = 0.3,
                }
            }
        }
    },
    cmd = "Trouble",
    keys = {
        {
            "<leader>cx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>cX",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer diagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>cd",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
    },
}
