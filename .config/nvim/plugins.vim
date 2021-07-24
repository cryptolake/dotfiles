if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))	
	echo 'Downloading junegunn/vim-plug to manage plugins...'	
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/	
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim	
	autocmd VimEnter * PlugInstall	
endif	

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))	
Plug 'tpope/vim-surround'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-commentary'
Plug 'honza/vim-snippets'
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'lewis6991/gitsigns.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'rktjmp/lush.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'npxbr/gruvbox.nvim'
Plug 'cryptolake/nvim-lspconfig'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/plenary.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'junegunn/goyo.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'kovetskiy/sxhkd-vim'
Plug 'ap/vim-css-color'
Plug 'hoob3rt/lualine.nvim'
Plug 'akinsho/nvim-bufferline.lua'
call plug#end()	

