return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- { "nvim-telescope/telescope-fzf-native.nvim" ,
        --     build = "make",
        --     config = function()
        --         require("telescope").load_extension("fzf")
        --       end,
        -- },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },

    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                       ["<C-k>"] = actions.move_selection_previous,
                       ["<C-j>"] = actions.move_selection_next,
                       ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            }
        })

        -- telescope.load_extension("fzf")

        local keymap = vim.keymap

        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {desc = "Fuzzy Find Files in CWD" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", {desc = "Fuzzy Find Recent Files" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", {desc = "Find String in CWD" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", {desc = "Find String Under Cursor in CWD" })
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", {desc = "Find TODOs"})
    end,
}
