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
  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  -- themes
  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

  use "mbbill/undotree" -- undo tree
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
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
  }
  -- debugging
  use 'mfussenegger/nvim-dap'
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
  -- docker
  -- use "jamestthompson3/nvim-remote-containers"
  -- null-ls
  use 'jose-elias-alvarez/null-ls.nvim'
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Fix tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

--Set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.exrc = true
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = 'a'

-- vim.opt.laststatus = 3
--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. '/.local/share/nvim/undo'

-- auto change dir
-- vim.opt.autochdir = true

vim.opt.clipboard = 'unnamedplus'
--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme
vim.o.termguicolors = true
vim.cmd [[
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
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
" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <leader>] :bn<CR>
nnoremap <leader>[ :bp<CR>
nnoremap <silent><leader>d :bd<CR>
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
vim.opt.laststatus = 3

--Enable Comment.nvim
require('Comment').setup()

local ft = require('Comment.ft');

ft.set('c', '/*%s*/');

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- No line number with terminal
vim.cmd [[
  autocmd TermOpen * setlocal nonumber norelativenumber
]]

-- Gitsigns
require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
-- Telescope
require('telescope').setup {
  pickers = {
    find_files = {
      no_ignore = true,
    }
  }
}

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'

--Add leader shortcuts

vim.cmd [[
nnoremap <leader>ff <cmd>Telescope find_files <cr>
nnoremap <leader><leader> <cmd>Telescope buffers <cr>
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
imap <silent><expr> <C-e> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
]]

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {"html"},
  },
  indent = {
    enable = true,
    disable = {"python"}
  },
}

-- Diagnostic keymaps
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[e', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']e', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })

-- LSP settings
-- lsp install

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
  buf_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('lspconfig')['pyright'].setup{
  on_attach = on_attach,
}

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
-- Setup nvim-cmp.
local luasnip = require 'luasnip'
require("luasnip.loaders.from_vscode").lazy_load()
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
  },
  sources = {
    { name = 'buffer' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
  },
}

-- null-ls is an attempt to bridge that gap and simplify the process of creating, 
-- sharing, and setting up LSP sources using pure Lua.
--
require("null-ls").setup({
  sources = {
    require("null-ls").builtins.diagnostics.flake8,
    require("null-ls").builtins.diagnostics.pydocstyle,
  },
})

-- vim: ts=2 sts=2 sw=2 et
