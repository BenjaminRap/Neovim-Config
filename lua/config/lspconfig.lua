local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local util = require("lspconfig.util")

local function on_attach_common(client, bufnr)
  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
  })
  vim.lsp.inlay_hint.enable(true)
end

vim.lsp.config("roslyn", {
	capabilities = capabilities,
	on_attach = on_attach_common,
	root_dit = function(name)
		return util.root_pattern("*.sln")(name)
			or util.root_pattern("*.csproj")(name)
			or util.root_pattern(".git")(name)
	end
})

lspconfig.clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach_common,
	cmd = {"clangd", "--inlay-hints=true" }
})

lspconfig.html.setup({
  capabilities = capabilities,
  on_attach = on_attach_common,
})

lspconfig.tailwindcss.setup({
  capabilities = capabilities,
  on_attach = on_attach_common,
})

lspconfig.glsl_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach_common,
})

lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach_common,
  filetypes = {
    'html', 'css', 'scss', 'javascriptreact', 'typescriptreact'
  },
})

lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = on_attach_common,
})

vim.keymap.set("n", '<leader>lp', function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach_common,
	settings = {
		Lua = {
			runtime = {
				-- Indiquer à LuaLS que nous utilisons Neovim
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				-- Activer les diagnostics pour Lua
				enable = true,
				globals = {'vim', 'MiniFiles'},  -- Ajoute 'vim' comme variable globale pour Neovim
			},
			-- workspace = {
			-- 	library = vim.api.nvim_get_runtime_file("", true),
			-- },
			-- -- Pour activer l'autocomplétion et autres fonctionnalités
			completion = { enable = true },
		},
	},
})

lspconfig.hls.setup({
	capabilities = capabilities,
	cmd = { 'haskell-language-server-wrapper', '--lsp' },
    filetypes = { 'haskell', 'lhaskell', 'cabal' },
    root_dir = lspconfig.util.root_pattern('hie.yaml', 'stack.yaml', 'cabal.project', '*.cabal', 'package.yaml'),
    single_file_support = true,
})

lspconfig.ts_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach_common,
  cmd = { "typescript-language-server", "--stdio" },
})
