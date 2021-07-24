let mapleader =' '
if ! isdirectory(system('echo -n "${XDG_DATA_HOME:-$HOME/local/share}/nvim/site/pack/packer/start/packer.nvim"'))	
	echo 'Downloading Packer.nvim to manage plugins...'	
	silent !git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	autocmd VimEnter * PackerInstall
endif	

lua require('crypto')
runtime ./maps.vim 
colorscheme gruvbox

set incsearch	
set hlsearch	
set bs=2	
set nobackup	
set go=a
set termguicolors
set clipboard+=unnamedplus
set background=dark
set hlsearch
set mouse=a
set nohlsearch
set undofile
set undodir=~/.local/share/nvim/undo
set completeopt=menuone,noselect
filetype plugin indent on
" let g:deoplete#enable_at_startup = 1
	" nnoremap c "_c
set nocompatible
syntax on
set encoding=utf-8
set number relativenumber
" Enable autocompletion:
set wildmode=longest,list,full
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright


" Commentary 
autocmd FileType pascal setlocal commentstring={%s} 

hi Normal guibg=NONE ctermbg=NONE

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
