let mapleader =' '

runtime ./plugins.vim
colorscheme gruvbox
let g:airline_theme='gruvbox'	
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set incsearch	
set hlsearch	
set bs=2	
set nobackup	
set termguicolors
set go=a
set clipboard+=unnamedplus
set background=dark
set hlsearch
set mouse=a
set nohlsearch
set undofile
set undodir=/tmp
set completeopt=menuone,noselect
filetype plugin indent on
" let g:deoplete#enable_at_startup = 1
	" nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'


" Commentary 
	autocmd FileType pascal setlocal commentstring={%s} 





runtime ./maps.vim 
runtime ./compe.vim
runtime ./treesitter.vim
runtime ./lsp.vim
runtime ./lualine.vim
