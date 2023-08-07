local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.skip_server_setup({'jdtls'})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

local cmp = require('cmp')
local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
	mapping = {
		['<C-k>'] = cmp.mapping.select_prev_item(cmp_select_opts),
		['<C-j>'] = cmp.mapping.select_next_item(cmp_select_opts),
		['<CR>'] = cmp.mapping.confirm({ select = true })
		-- ['<C-Space>'] = cmp.mapping.complete()
	}
})

lsp.setup()
