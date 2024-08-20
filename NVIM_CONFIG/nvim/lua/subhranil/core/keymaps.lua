vim.g.mapleader = " "

local keymap = vim.keymap

-- keymap.set("i", "jk", "<ESC>", {desc = "Exit insert mode with jk"})

keymap.set("n", "<leader>nh", ":nohl<CR>", {desc = "Clear Search Highlights"})

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", {desc = "Split Window Vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", {desc = "Split Window Horizontally" }) -- split window vertically
keymap.set("n", "<leader>sx", "<cmd>close<CR>", {desc = "Close Current Split View" }) -- split window vertically

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", {desc = "Open new tab" }) -- Open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", {desc = "Close tab" }) -- Close Current Split
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", {desc = "Go to next tab" }) -- Go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", {desc = "Go to prev tab" }) -- Got to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", {desc = "Close Current Split" }) -- open current buffer in new tab

