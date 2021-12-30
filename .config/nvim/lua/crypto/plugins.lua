local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Package manager

	use "tpope/vim-surround" -- surround text the vim way
	use "numToStr/Comment.nvim"

	-- themes
	use {
		"ellisonleao/gruvbox.nvim",
		requires = {"rktjmp/lush.nvim"}
	}

	use 'lewis6991/impatient.nvim'
	-- UI to select things (files, grep results, open buffers...)
	use { 'nvim-telescope/telescope.nvim',
		requires = {  'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'  }
	}

	-- git and github integration
	use {
		'lewis6991/gitsigns.nvim',
		'tpope/vim-fugitive'
	}

	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use {
		'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
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
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
		}
	}

	-- autopairs
	use 'windwp/nvim-autopairs'

	-- snippets
	use {
		'L3MON4D3/LuaSnip',
		'rafamadriz/friendly-snippets',
		config = require("luasnip.loaders.from_vscode").lazy_load()
	}

	-- visual stuff

	use {
		'akinsho/bufferline.nvim',
		config = require("bufferline").setup()
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = require'lualine'.setup()
	}

	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {
		'ap/vim-css-color'
	}

end)
