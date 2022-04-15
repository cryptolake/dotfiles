-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
  augroup Packer
  autocmd!
  autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]]

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Package manager
	use "tpope/vim-surround" -- surround text the vim way

	-- themes
	use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

	use "mbbill/undotree" -- undo tree
	use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
	use 'ludovicchabant/vim-gutentags' -- Automatic tags management
	-- UI to select things (files, grep results, open buffers...)
	use { 'nvim-telescope/telescope.nvim',
		requires = {  'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'  }
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
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
			'hrsh7th/cmp-buffer',

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
		config = function() require'bufferline'.setup {} end
	}

	use "tversteeg/registers.nvim"

	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
	}


	use 'ap/vim-css-color'

	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		config = function() require'nvim-tree'.setup {} end
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)

--Set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.exrc = true
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true
vim.opt.undodir = '~/.local/share/nvim/undo'

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme gruvbox]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- very useful mappings
vim.cmd [[

" nvim tree toggle
nmap <leader>n <cmd>NvimTreeToggle<cr>

" Undo tree toggle
nmap <leader>u <cmd>UndotreeToggle<cr>

" Shortcutting split navigation, saving a keypress:
nmap <leader>w <C-w>

" Spell-check set to <leader>o, 'o' for 'orthography':
nmap <leader>o :setlocal spell! spelllang=en_us<CR>

" bufferline magical stuff

" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <leader>] :BufferLineCycleNext<CR>
nnoremap <leader>[ :BufferLineCyclePrev<CR>
nnoremap <leader><leader> <C-^>

nnoremap <silent><leader>bd :bd<CR>

" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Lsp
nnoremap <leader>lq :LspRestart<CR>

" Terminal mode
tnoremap <Esc> <C-\><C-n>

]]

--Set statusbar
require('lualine').setup {}

--Enable Comment.nvim
require('Comment').setup()

local ft = require('Comment.ft');

ft.set('c', '/*%s*/');

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })

vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Gitsigns
require('gitsigns').setup {
	signs = {
		add = { text = '+' },
		change = { text = '~' },
		delete = { text = '_' },
		topdelete = { text = '‾' },
		changedelete = { text = '~' },
	},
}

-- Telescope
require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
	},
}

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'

--Add leader shortcuts

vim.cmd [[

nnoremap <leader>ff <cmd>Telescope find_files <cr>
nnoremap <leader>fb <cmd>Telescope buffers <cr>
nnoremap <leader>f/ <cmd>Telescope current_buffer_fuzzy_find    <cr>
nnoremap <leader>fh <cmd>Telescope help_tags  <cr>
nnoremap <leader>ft <cmd>Telescope tags  <cr>
nnoremap <leader>fd <cmd>Telescope grep_string  <cr>
nnoremap <leader>fg <cmd>Telescope live_grep  <cr>
nnoremap <leader>fo <cmd>Telescope oldfiles  <cr>
nnoremap <leader>fr <cmd>lua require 'telescope'.extensions.file_browser.file_browser()  <cr>

nnoremap <leader>fs <cmd>Telescope lsp_document_symbols <cr>
nnoremap <leader>fw <cmd>Telescope lsp_workspace_symbols <cr>

nnoremap <leader>gb <cmd>Telescope git_branches <cr>
nnoremap <leader>gf <cmd>Telescope git_files <cr>
nnoremap <leader>gt <cmd>Telescope git_stash <cr>
nnoremap <leader>gs <cmd>Telescope git_status <cr>
nnoremap <leader>gc <cmd>Telescope git_commits <cr>

]]

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = 'gnn',
			node_incremental = 'grn',
			scope_incremental = 'grc',
			node_decremental = 'grm',
		},
	},
	indent = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
	},
}


-- LSP settings
-- lsp install
local lsp_installer = require'nvim-lsp-installer'

local function on_attach(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = {noremap = true, silent = true}

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	-- Mappings.
	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	buf_set_keymap('n', '[e', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']e', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
	buf_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)


local installed_servers = lsp_installer.get_installed_servers()
for _, server in pairs(installed_servers) do
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	if server.name == "sumneko_lua" then
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file('', true),
			},
			telemetry = {
				enable = false,
			}
		}
	end

	server:setup(opts)
end


-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
-- Setup nvim-cmp.
local luasnip = require 'luasnip'
require('nvim-autopairs').setup{}
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' }
  },
}

-- vim: ts=2 sts=2 sw=2 et
