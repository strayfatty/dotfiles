return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,    -- make sure to load this during startup
  priority = 1000, -- make sure to load this first
  config = function()
    vim.cmd.colorscheme("rose-pine")

    -- transparent background is not working well with dialogs
    --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
} 
