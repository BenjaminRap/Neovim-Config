local util = require("lspconfig.util")
local lspshared = require("config.lspshared")
local capabilities = lspshared.capabilities
local on_attach_common = lspshared.on_attach_common

vim.lsp.config("roslyn", {
	capabilities = capabilities,
	on_attach = on_attach_common,
	root_dit = function(name)
		return util.root_pattern("*.sln")(name)
			or util.root_pattern("*.csproj")(name)
			or util.root_pattern(".git")(name)
	end
})

vim.lsp.config("clangd", {
	capabilities = capabilities,
	on_attach = on_attach_common,
	cmd = {"clangd", "--inlay-hints=true" }
})

vim.lsp.config("jsonls", {
	capabilities = capabilities,
	on_attach = on_attach_common,
	settings = {
		schemas = require("schemastore").json.schemas(),
		validate = {enable = true}
	}
})

vim.lsp.config("html", {
  capabilities = capabilities,
  on_attach = on_attach_common,
})

vim.lsp.config("tailwindcss", {
  capabilities = capabilities,
  on_attach = on_attach_common,
})

vim.lsp.config("glsl_analyzer", {
  capabilities = capabilities,
  on_attach = on_attach_common,
})

vim.lsp.config("emmet_ls", {
  capabilities = capabilities,
  on_attach = on_attach_common,
  filetypes = {
    'html', 'css', 'scss', 'javascriptreact', 'typescriptreact'
  },
})

vim.lsp.config("cssls", {
  capabilities = capabilities,
  on_attach = on_attach_common,
})

vim.keymap.set("n", '<leader>lp', function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {})

vim.lsp.config("lua_ls", {
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

vim.lsp.config("hls", {
	capabilities = capabilities,
	cmd = { 'haskell-language-server-wrapper', '--lsp' },
    filetypes = { 'haskell', 'lhaskell', 'cabal' },
    root_dir = require("lspconfig").util.root_pattern('hie.yaml', 'stack.yaml', 'cabal.project', '*.cabal', 'package.yaml'),
    single_file_support = true,
})

vim.lsp.config("ts_ls", {
	capabilities = capabilities,
	on_attach = on_attach_common,
	cmd = { "typescript-language-server", "--stdio" },
	settings = {
		typescript = {
			preferTypeOnlyAutoImports = true
		}
	}
})


vim.lsp.config("tailwindcss", {
	capabilities = capabilities,
	cmd = { "tailwindcss-language-server", "--stdio" },
	root_dir = require("lspconfig").util.root_pattern("tailwind.config.js", "package.json"),
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
			includeLanguages = {
				eelixir = "html-eex",
				elixir = "phoenix-heex",
				eruby = "erb",
				heex = "phoenix-heex",
				htmlangular = "html",
				templ = "html",
				typescript = "html",
				typescriptreact = "html"
			},
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning"
			},
			validate = true
		}
	},
})
