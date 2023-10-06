-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({

  -- themes
  {"ellisonleao/gruvbox.nvim", dependencies = {"rktjmp/lush.nvim"}},

  {
    "mbbill/undotree"
  }, -- undo tree
  'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
  -- UI to select things (files, grep results, open buffers...)
  { 'nvim-telescope/telescope.nvim',
    dependencies = {  'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'  }
  },
  {'nvim-telescope/telescope-ui-select.nvim' },
  {'nvim-telescope/telescope-fzf-native.nvim',
  build = 'make',
  },
  { "nvim-telescope/telescope-file-browser.nvim" },
  -- git and github integration
  {
    'lewis6991/gitsigns.nvim',
  },
  { 'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim' },
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  {
    'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
    'nvim-treesitter/nvim-treesitter-textobjects'
  },

  -- lsp stuff
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- 'j-hui/fidget.nvim',
    },
  },
  -- debugging
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "jay-babu/mason-nvim-dap.nvim",
    }
  },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'uga-rosa/cmp-dictionary'
    }
  },

  -- autopairs
  'windwp/nvim-autopairs',

  -- snippets
  {
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
  },

  -- visual stuff
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {'kyazdani42/nvim-web-devicons', opt = true},
  },

  'ap/vim-css-color',

  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  },

  {
    "tversteeg/registers.nvim",
    config = function()
      require("registers").setup()
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  -- Iron neovim
  {
    'hkupty/iron.nvim'
  },

  -- Testing
  {
    "nvim-neotest/neotest",
    "nvim-neotest/neotest-python",
  }
})

-- Fix tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

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
highlight Normal guibg=none
highlight NonText guibg=none
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
nmap <leader>n <cmd>NvimTreeFindFileToggle<cr>
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
nnoremap <silent><leader>bd :bd<CR>
" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

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
    },
    buffers =  {
      mappings = {
        i = {
          ["<C-d>"] = 'delete_buffer'
        },
        n = {
          ["D"] = 'delete_buffer'
        }

      }
    }

  }
}

-- Enable telescope fzf native
require('telescope').load_extension('fzf')
require("telescope").load_extension("ui-select")
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
" FIXME: workspace symbols
" nnoremap <leader>fw <cmd>Telescope lsp_workspace_symbols <cr>
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
    disable = {"c"}
  },
}


require("nvim-tree").setup({
  sync_root_with_cwd = true,
  filters = {
    dotfiles = false,
  },
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    -- update_root = true
  },
})
-- Diagnostic keymaps
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[e', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']e', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })

-- Neogit
vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>Neogit<CR>', { noremap = true, silent = true })

local neogit = require('neogit')
neogit.setup {}

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


-- Setup mason so it can manage external tooling
require('mason').setup()

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
local servers = { 'clangd', 'pyright', 'tsserver', 'lua_ls'}

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Turn on status information
-- require('fidget').setup()

-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, 'lua/?.lua')
-- table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = 'LuaJIT',
        -- Setup your lua path
        -- path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      -- workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}

require('lspconfig').pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
        stubPath = "~/src/python-type-stubs",
        autoImportCompletions = false
      }
    }
  },
}

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
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  },
}


  -- Set configuration for specific filetype.
  cmp.setup.filetype({'gitcommit', 'markdown'}, {
    sources = cmp.config.sources({
      { name = 'buffer' },
      {
        name = 'dictionary',
        keyword_length = 2
      }
    })
  })

local dict = require("cmp_dictionary")

dict.setup({
  -- The following are default values.
  exact = 2,
  first_case_insensitive = false,
  document = false,
  document_command = "wn %s -over",
  async = false,
  max_items = -1,
  capacity = 5,
  debug = false,
})

dict.switcher({
  -- filetype = {
  --   lua = "/path/to/lua.dict",
  --   javascript = { "/path/to/js.dict", "/path/to/js2.dict" },
  -- },
  -- filepath = {
  --   [".*xmake.lua"] = { "/path/to/xmake.dict", "/path/to/lua.dict" },
  --   ["%.tmux.*%.conf"] = { "/path/to/js.dict", "/path/to/js2.dict" },
  -- },
  spelllang = {
    en = "~/.config/nvim/my.dict",
  },
})

-- TODO: linting 
--

-- nvim DAP configuration

-- Automatically setup debuggers

require('dap.ext.vscode').load_launchjs(nil, {})
require("dapui").setup()
local dap, dapui =require("dap"),require("dapui")
dap.listeners.after.event_initialized["dapui_config"]=function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"]=function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"]=function()
  dapui.close()
end

vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

vim.keymap.set('n', '<leader>dq', function() require('dap').terminate() end)
vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>do', function() require('dap').step_over() end)
vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end)
vim.keymap.set('n', '<leader>du', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
-- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)


require ('mason-nvim-dap').setup({
    ensure_installed = {'debugpy'},
    handlers = {
        function(config)
          -- all sources with no handler get passed here

          -- Keep original functionality
          require('mason-nvim-dap').default_setup(config)
        end,
    },
})

local iron = require("iron.core")
local view = require("iron.view")

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = {"zsh"}
      }
    },
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = view.split("40%"),
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<leader>sc",
    visual_send = "<leader>sc",
    send_file = "<leader>sf",
    send_line = "<leader>sl",
    send_mark = "<leader>sm",
    mark_motion = "<leader>mc",
    mark_visual = "<leader>mc",
    remove_mark = "<leader>md",
    cr = "<leader>s<cr>",
    interrupt = "<leader>s<space>",
    exit = "<leader>sq",
    clear = "<leader>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<leader>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<leader>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<leader>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<leader>rh', '<cmd>IronHide<cr>')

require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
  },
})


vim.keymap.set('n', '<leader>Tr', function() require("neotest").run.run() end)
vim.keymap.set('n', '<leader>Tf', function() require("neotest").run.run(vim.fn.expand("%")) end)
vim.keymap.set('n', '<leader>Td', function() require("neotest").run.run({strategy = "dap"}) end)
vim.keymap.set('n', '<leader>Tq', function() require("neotest").run.stop() end)
vim.keymap.set('n', '<leader>Ta', function() require("neotest").run.attach() end)

-- vim: ts=2 sts=2 sw=2 et
