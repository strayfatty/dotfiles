vim.g.mapleader = " "

-- stay in visual mode after indent
vim.keymap.set("v", "<", "< gv")
vim.keymap.set("v", ">", "> gv")

vim.keymap.set("n", "<leader>f", "<nop>", { desc = "File" })
vim.keymap.set("n", "<leader>b", "<nop>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>w", "<nop>", { desc = "Window" })

vim.keymap.set("n", "<leader>fs", vim.cmd.update)

vim.keymap.set("n", "<leader>w+", "<C-W>+", { desc = "Increase height" } )
vim.keymap.set("n", "<leader>w-", "<C-W>-", { desc = "Decrease height" } )
vim.keymap.set("n", "<leader>w<", "<C-W><", { desc = "Decrease width" } )
vim.keymap.set("n", "<leader>w=", "<C-W>=", { desc = "Equally high and wide" } )
vim.keymap.set("n", "<leader>w>", "<C-W>>", { desc = "Increase width" } )
vim.keymap.set("n", "<leader>w_", "<C-W>_", { desc = "Max out the height" } )
vim.keymap.set("n", "<leader>w|", "<C-W>|", { desc = "Max out the width" } )
vim.keymap.set("n", "<leader>wd", "<C-W>q", { desc = "Quit a window" } )
vim.keymap.set("n", "<leader>wh", "<C-W>h", { desc = "Go to the left window" } )
vim.keymap.set("n", "<leader>wj", "<C-W>j", { desc = "Go to the down windows" } )
vim.keymap.set("n", "<leader>wk", "<C-W>k", { desc = "Go to the up window" } )
vim.keymap.set("n", "<leader>wl", "<C-W>l", { desc = "Go to the right window" })
vim.keymap.set("n", "<leader>wo", "<C-W>o", { desc = "Close all other windows" })
vim.keymap.set("n", "<leader>ws", "<C-W>s", { desc = "Split window" })
vim.keymap.set("n", "<leader>wT", "<C-W>T", { desc = "Break out into a new tab" })
vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>ww", "<C-W>w", { desc = "Switch windows" })
vim.keymap.set("n", "<leader>wx", "<C-W>x", { desc = "Swap current with next" })

vim.keymap.set("n", "<leader><tab>", "za", { desc = "Toggle folding" })

vim.keymap.set("n", "<leader>pP", function()
    vim.cmd("cd ~/.config/nvim")
end, { desc = "nvim config" })


vim.keymap.set("n", "<leader>vb", function()
    -- TODO: get directory for current buffer or HOME
    -- TODO: get all entires for directory
    -- TODO: build window with title, input and entry list
    -- TODO: update entries when input changes
    -- TODO: change selected value with up/down
    -- TODO: accept selected value with enter

    local bufnr = vim.api.nvim_create_buf(false, true);
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, {
        "*/12   Find file: ~/",
        "line 2",
    })

    local options = {
        relative = "editor",
        width = 100,
        height = 10,
        row = 5,
        col = 10,
        style = "minimal",
        border = "single",
    }

    local winid = vim.api.nvim_open_win(bufnr, true, options)

    vim.api.nvim_create_autocmd("BufLeave", {
        buffer = bufnr,
        nested = true,
        once = true,
        callback = function()
            vim.api.nvim_win_close(winid, true)
        end
    })

    vim.keymap.set("", "<ESC>", function()
        vim.api.nvim_win_close(winid, true)
    end, { buffer = bufnr, desc = "close window" })
end, { desc = "floating window test" })
