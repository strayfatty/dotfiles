return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local ts_actions = require("telescope.actions.set")
        local fb_actions = require("telescope._extensions.file_browser.actions")

        telescope.setup({
            extensions = {
                file_browser = {
                    theme = "ivy",
                    mappings = {
                        ["n"] = {
                            ["h"] = fb_actions.goto_parent_dir,
                            ["l"] = ts_actions.select,
                        }
                    },
                },
            },
        })

        telescope.load_extension "file_browser"

        vim.keymap.set("n", "<leader>ff", "<cmd>Telescope file_browser path=%:p:h initial_mode=normal<cr>", { desc = "Find files" })
    end
}
