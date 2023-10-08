" Set line number and relative line number "
set number
set relativenumber

" Tab, Space and indentation settings "
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent

" Enable Mouse "
set mouse=a

" Enable Syntax "
syntax on

" Enable highlight search pattern "
set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Red

" Show the matching parts of pain [] {} () "
set showmatch

" Remove trailing whitespace from following types of files "
autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e

" Set Color Scheme "
" set termguicolors "
colorscheme desert

" Highlight Cursor line "
set cursorline
:highlight Cursorline Cterm=bold Ctermbg=235

" Visual mode Color scheme "
:hi Visual cterm=none ctermbg=232 ctermfg=046
