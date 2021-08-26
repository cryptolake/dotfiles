local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Package manager
	use 'tpope/vim-fugitive' -- Git commands in nvim
	use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
	use "tpope/vim-surround"
	use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
	use 'hoob3rt/lualine.nvim'
	-- UI to select things (files, grep results, open buffers...)
	use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }
	-- Add git related info in the signs columns and popups
	use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
		'nvim-treesitter/nvim-treesitter-textobjects'
	}
	-- Additional textobjects for treesitter
	use 'kyazdani42/nvim-web-devicons'
	use {
		'neovim/nvim-lspconfig',
		'williamboman/nvim-lsp-installer',
	}
	use {
		'hrsh7th/nvim-cmp', -- Autocompletion plugin
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
		'saadparwaiz1/cmp_luasnip'
	}
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
	use 'junegunn/goyo.vim'
	use 'ap/vim-css-color'
	use 'akinsho/nvim-bufferline.lua'
	use 'kyazdani42/nvim-tree.lua'
end)
