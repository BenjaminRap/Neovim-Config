local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.clangd.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		vim.diagnostic.config({
			virtual_text = true,   -- Affiche les erreurs directement dans le code
			signs = true,          -- Affiche des icônes d'erreur dans la marge
			update_in_insert = false,
		})
		vim.lsp.inlay_hint.enable(true)
	end,
	cmd = {"clangd", "--inlay-hints=true" }
})

vim.keymap.set("n", '<leader>lp', function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
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
  capabilities = capabilities,  -- Assure-toi d'avoir une configuration `capabilities` appropriée, comme avec clangd
  on_attach = function(client, bufnr)
    -- Configurer les diagnostics
    vim.diagnostic.config({
      virtual_text = true,   -- Affiche les erreurs directement dans le code
      signs = true,          -- Affiche des icônes d'erreur dans la marge
      update_in_insert = false,
    })
    -- Activer les inlay hints
    vim.lsp.inlay_hint.enable(true)
  end,
  cmd = { "typescript-language-server", "--stdio" },  -- Lancer le serveur avec l'option `--stdio`
})
