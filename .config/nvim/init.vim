let mapleader =' '
if ! isdirectory(system('echo -n "${XDG_DATA_HOME:-$HOME/local/share}/nvim/site/pack/packer/start/packer.nvim"'))	
	echo 'Downloading Packer.nvim to manage plugins...'	
	silent !git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	autocmd VimEnter * PackerInstall
endif	


set incsearch	
set exrc
set hlsearch	
set bs=2	
set hidden
set go=a
set clipboard+=unnamedplus
set mouse=a
set nohlsearch
set noswapfile
set nobackup
set undofile
set undodir=~/.local/share/nvim/undo
set dictionary+=/usr/share/dict/words
filetype plugin indent on
set nocompatible
syntax on
set encoding=utf-8
set relativenumber
set number
set scrolloff=8
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright


" Commentary 
autocmd FileType pascal setlocal commentstring={%s} 


" Save file as sudo on files that require root permission
command W execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
" cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
lua require('crypto')
runtime ./maps.vim 
colorscheme gruvbox
set background=dark
hi Normal guibg=NONE ctermbg=NONE
set termguicolors
