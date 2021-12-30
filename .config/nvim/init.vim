let mapleader =' '

filetype plugin indent on
colorscheme gruvbox
set incsearch	
set exrc
set hlsearch	
set bs=2	
set hidden
set go=a
set ts=4 sw=4
set tabstop=4
set clipboard+=unnamedplus
set scrolloff=999
set nowrap
set mouse=a
set nohlsearch
set noswapfile
set nobackup
set undofile
set undodir=~/.local/share/nvim/undo
set dictionary+=/usr/share/dict/words
set nocompatible
syntax on
set encoding=utf-8
set relativenumber
set number

set background=dark
hi Normal guibg=NONE ctermbg=NONE
set termguicolors

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" using netrw as project drawer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Save file as sudo on files that require root permission
com -bar W exe 'w !sudo tee >/dev/null %:p:S' | setl nomod
runtime ./maps.vim 
lua require('crypto')
