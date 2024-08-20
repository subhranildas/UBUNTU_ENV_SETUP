return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,

    opts = {
        -- Your configuration comes here
        -- using default unless overwritten here
        -- refer to the configuration
    },
}
