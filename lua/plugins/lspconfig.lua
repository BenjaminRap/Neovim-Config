return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				registries = {
					"github:Crashdummyy/mason-registry", -- Custom registry for rosly.nvim
					"github:mason-org/mason-registry", -- Default registry
				},
			})
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", "clangd", "omnisharp",
				}
			})
		end
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			require("config.lspconfig")
		end
	}
}
