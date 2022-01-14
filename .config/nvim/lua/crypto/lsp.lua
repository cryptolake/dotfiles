
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

