local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
  	-- see :help lsp-zero-keybindings
  	-- to learn the available actions
  	lsp.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  	ensure_installed = {
		"tsserver",
		"eslint",
		"cssls",
		"clangd",
		"html",
		"jsonls",
		"jdtls",
		"marksman",
		"pyright"
	},
  	handlers = {
    		lsp.default_setup,
  	},
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
})

