return {
    "folke/tokyonight.nvim",
    priority = 1000,

    config = function()
        require("tokyonight").setup({
            -- Tokyonight theme
            style = "night",
            -- Transperency Setting
            transparent = true,
            sidebars = "transparent",
            floats = "transparent",

            on_colors = function(colors)
                colors.bg = "#000000"
            end
        })

        vim.cmd("colorscheme tokyonight")
    end
}
