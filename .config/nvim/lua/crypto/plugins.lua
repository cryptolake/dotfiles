return require('packer').startup(function()
	use {'wbthomason/packer.nvim'}
	use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
	use {"tpope/vim-surround"}
	use {'nvim-lua/popup.nvim'}
	use {'nvim-telescope/telescope.nvim'}
	use {'tpope/vim-commentary'}
	use {'honza/vim-snippets'}
	use {'rafamadriz/friendly-snippets'}
	use {'hrsh7th/vim-vsnip'}
	use {'hrsh7th/vim-vsnip-integ'}
	use {'kyazdani42/nvim-web-devicons'}
	use {'lewis6991/gitsigns.nvim'}
	use {'kyazdani42/nvim-tree.lua'}
	use {'rktjmp/lush.nvim'}
	use {'windwp/nvim-autopairs'}
	use {'neovim/nvim-lspconfig'}
	use {'kabouzeid/nvim-lspinstall'}
	use {'nvim-lua/plenary.nvim'}
	use {'hrsh7th/nvim-compe'}
	use {'junegunn/goyo.vim'}
	use {'nvim-treesitter/nvim-treesitter' , run = 'TSUpdate'}
	use {'kovetskiy/sxhkd-vim'}
	use {'ap/vim-css-color'}
	use {'hoob3rt/lualine.nvim'}
	use {'akinsho/nvim-bufferline.lua'}

end)
