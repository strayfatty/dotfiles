return {
    "qpkorr/vim-bufkill",
    init = function()
        vim.keymap.set("n", "<leader>bd", "<cmd>BD<cr>", { desc = "Kill buffer" })
    end
}
