return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
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
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true
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
