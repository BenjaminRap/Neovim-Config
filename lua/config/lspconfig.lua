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
	end
})

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

lspconfig.omnisharp.setup({
	capabilities = capabilities,
	cmd = {
		"omnisharp",
		"--languageserver",
		"--hostPID",
		tostring(vim.fn.getpid())
	},
	settings = {
		RoslynExtensionsOptions = {
			enableDecompilationSupport = false,
			enableImportCompletion = true,
			enableAnalyzersSupport = true,
		}
	},
	root_dir = lspconfig.util.root_pattern("*.sln")
})
