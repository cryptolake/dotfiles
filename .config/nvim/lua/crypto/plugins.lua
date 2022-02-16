
require('packer').startup(function()

	use 'wbthomason/packer.nvim' -- Package manager
	
	use "tpope/vim-surround" -- surround text the vim way

	use "mbbill/undotree" -- undo tree

	use "numToStr/Comment.nvim"

	-- themes
	use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

	-- UI to select things (files, grep results, open buffers...)
	use { 'nvim-telescope/telescope.nvim',
		requires = {  'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'  }
	}
	use { "nvim-telescope/telescope-file-browser.nvim" }

	-- git and github integration
	use {
		'lewis6991/gitsigns.nvim',
	}
	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

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
	}

	-- visual stuff

	use {
		'akinsho/bufferline.nvim',
	}

	use "tversteeg/registers.nvim"

	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
	}

	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	use 'ap/vim-css-color'

	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
	}

	if packer_bootstrap then
		require('packer').sync()
	end

end)
