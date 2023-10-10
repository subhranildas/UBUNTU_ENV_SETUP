" Set line number and relative line number "
set number
set relativenumber

" Tab, Space and indentation settings "
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=100
set expandtab
set autoindent

" Enable Mouse "
set mouse=a

" Enable Syntax "
syntax on

" Enable highlight search pattern "
set hlsearch

" Show the matching parts of pain [] {} () "
set showmatch
set ignorecase

" Remove trailing whitespace from following types of files "
autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e

" Set Color Scheme "
set termguicolors
colorscheme desert

" Highlight Cursor line "
set cursorline
hi CursorLine Cterm=bold Ctermbg=235 guibg=Gray27

" Visual mode Color scheme "
hi Visual term=reverse cterm=reverse ctermbg=242 guifg=Grey3 guibg=DeepPink3

" Modify Highlight settings for Search "
hi Search term=underline ctermfg=248 ctermbg=12 guifg=MediumOrchid3 guibg=Black

" Set background to none "
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
