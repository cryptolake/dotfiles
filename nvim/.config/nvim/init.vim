let mapleader =";"

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'mboughaba/i3config.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'chriskempson/base16-vim'
Plug 'kovetskiy/sxhkd-vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
call plug#end()

set title
set ruler
set showmatch
set ignorecase
set incsearch
set hlsearch
set bs=2
set nobackup
set go=a
set hlsearch
set mouse=a
set undofile
set undodir=/tmp
set nohlsearch
set completeopt=menuone,noinsert,noselect
set completeopt-=preview
" set clipboard+=unnamedplus to use vim regs
filetype plugin indent on
set nofoldenable


" Set completeopt to have a better completion experience

" Avoid showing message extra message when using completion
set shortmess+=c
" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing: 
	map <leader>g :Goyo<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" easier file completion
imap <C-f>  <C-x><C-f>


 " Ignore whitespace whilst diffing
set diffopt+=iwhite

" some other forgotten basics
set list listchars=nbsp:¬,tab:»·,trail:·,extends:> "lets hidden chars be shown
set shiftwidth=4
set softtabstop=4
set tabstop=4

" FZF buffers
nnoremap gb :Buffers<CR>

" pascal 
autocmd FileType pascal setlocal commentstring={%s}

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost files,directories !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

"vimwiki change default directory
let g:vimwiki_list = [{'path': '~/Documents/wiki/'}]


" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" system clipboard
nnoremap gp "+p
nnoremap gP "+P
vnoremap gp "+p
vnoremap gP "+P
nnoremap gy "+y
vnoremap gy "+y
