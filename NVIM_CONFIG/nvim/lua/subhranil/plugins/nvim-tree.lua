return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            view = {
                width = 35,
                number = false,
                relativenumber = true,
                side = "left",
            },

            sort = {
                sorter = "case_sensitive",
            },

            renderer = {
                group_empty = true,
                indent_markers = {
                    enable = true,
                },
                icons = {

                },
            },
            -- Window picker disable
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },

            git = {
                ignore = false,
            },
        })
    end
}
