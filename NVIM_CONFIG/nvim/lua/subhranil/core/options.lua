vim.cmd("let g:netrw_liststyle = 3")

-- Add autocommand to keep background of nvim transparent for NvimTree
vim.cmd("autocmd VimEnter * hi NvimTreeNormal guibg=NONE" )
vim.cmd("autocmd VimEnter * hi NvimTreeNormalNC guibg=NONE" )

-- Remove Trailing Whitespaces from following files
vim.cmd("autocmd BufWritePre *.c :%s/\\s\\+$//e" )
vim.cmd("autocmd BufWritePre *.h :%s/\\s\\+$//e" )
vim.cmd("autocmd BufWritePre *.sh :%s/\\s\\+$//e" )
vim.cmd("autocmd BufWritePre *.md :%s/\\s\\+$//e" )
vim.cmd("autocmd BufWritePre *.txt :%s/\\s\\+$//e" )
vim.cmd("autocmd BufWritePre *.lua :%s/\\s\\+$//e" )
vim.cmd("autocmd BufWritePre *.js :%s/\\s\\+$//e" )
vim.cmd("autocmd BufWritePre *.py :%s/\\s\\+$//e" )

-- Move highlighted Lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv" )
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv" )

local opt = vim.opt

-- Setup Line number and relative line number
opt.number = true
opt.relativenumber = true

-- tabs & indentations
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true

opt.smartindent = true

opt.wrap = false

-- Scrolloff at 10
opt.scrolloff = 10

-- Add 80 character Column
vim.opt.colorcolumn = "80"

-- Search Settings
opt.ignorecase = true   -- ignores case when searching
opt.smartcase = true    -- if mized cases search then assumes case-sensitive search

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- Colorscheme forced dark
opt.signcolumn = "yes"  -- Show sign column so that text doesn't shift

-- Backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- Split windows
opt.splitright = true   -- Split vertical window to the wright
opt.splitbelow = true   -- Split horizontal window to the bottom

