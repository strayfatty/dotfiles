return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local function on_attach(bufnr)
            local api = require("nvim-tree.api")

            local function opts(desc)
                return {
                    desc = "nvim-tree: " .. desc,
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                    nowait = true
                }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
            vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
        end

        require("nvim-tree").setup({
            on_attach = on_attach,
            view = {
                width = 35,
                relativenumber = true,
            },
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            filters = {
                custom = { ".DS_Store" },
            },
            git = {
                ignore = false,
            },
        })

        vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
        vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Toggle file explorer on current file" })
        vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<cr>", { desc = "Collapse the file explorer" })
        vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<cr>", { desc = "Refresh file explorer" })
    end
}
