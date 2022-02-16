let mapleader =' '

lua << EOF

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

EOF

colorscheme gruvbox
syntax on
set incsearch	
set exrc
set hlsearch	
set bs=2	
set go=a
set ts=4 sw=4
set tabstop=4
set clipboard+=unnamedplus
set scrolloff=0
set mouse=a
set nohlsearch
set noswapfile
set nobackup
set undofile
set undodir=~/.local/share/nvim/undo
set dictionary+=/usr/share/dict/words
set nocompatible
set encoding=utf-8
set number
set relativenumber
set background=dark
set termguicolors

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set splitbelow splitright

" Save file as sudo on files that require root permission
com -bar W exe 'w !sudo tee >/dev/null %:p:S' | setl nomod
runtime ./maps.vim 
lua require('crypto')
