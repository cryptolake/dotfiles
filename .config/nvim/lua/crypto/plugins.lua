return require('packer').startup(function()
	use {'wbthomason/packer.nvim'}
	use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
	use {'nvim-treesitter/nvim-treesitter' , run = ':TSUpdate'}
	use {'nvim-lua/popup.nvim'}
	use {'nvim-telescope/telescope.nvim'}
	use {'tpope/vim-commentary'}
	use {'rafamadriz/friendly-snippets'}
	use {'hrsh7th/vim-vsnip'}
	use {'hrsh7th/vim-vsnip-integ'}
	use {'kyazdani42/nvim-web-devicons'}
	use {'lewis6991/gitsigns.nvim'}
	use {'kyazdani42/nvim-tree.lua'}
	use {'windwp/nvim-autopairs'}
	-- lsp stuff
	use {
		'neovim/nvim-lspconfig',
		'williamboman/nvim-lsp-installer',
	}
	-- use {'cryptolake/nvim-lspconfig'}
	use {'nvim-lua/plenary.nvim'}
	use {'hrsh7th/nvim-compe'}
	use {'junegunn/goyo.vim'}
	use {'ap/vim-css-color'}
	use {'hoob3rt/lualine.nvim'}
	use {'akinsho/nvim-bufferline.lua'}

end)
