local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Package manager

	use "tpope/vim-surround" -- surround text the vim way
	use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines

	-- UI to select things (files, grep results, open buffers...)
	use { 'nvim-telescope/telescope.nvim', requires = {  'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'  } }


	-- git and github integration
	use { 'lewis6991/gitsigns.nvim', -- Add git related info in the signs columns and popups
		'tpope/vim-fugitive', -- Git commands in nvim
		'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
	}

	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
		'nvim-treesitter/nvim-treesitter-textobjects'
	}

	-- lsp stuff
	use {
		'neovim/nvim-lspconfig',
		'williamboman/nvim-lsp-installer',
	}

	-- Autocompletion
	use {
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
		'saadparwaiz1/cmp_luasnip',
		'windwp/nvim-autopairs'

	}

	-- snippets
	use {
		'L3MON4D3/LuaSnip',
		'rafamadriz/friendly-snippets'
		}

	-- Gruvbox theme
	use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

	-- visual stuff
	use {'hoob3rt/lualine.nvim',
		'kyazdani42/nvim-web-devicons',
		'ap/vim-css-color'
	}

	-- Tree explorer
	use 'kyazdani42/nvim-tree.lua'
end)
