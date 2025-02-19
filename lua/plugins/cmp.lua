return {
	'hrsh7th/nvim-cmp',
	lazy = false,
	priority = 100,
	dependencies = {
		'onsails/lspkind.nvim',
		'hrsh7th/cmp-nvim-lsp',        -- Source pour LSP
		'hrsh7th/cmp-buffer',          -- Source pour le buffer courant
		'hrsh7th/cmp-path',            -- Source pour les chemins de fichiers
		{ 'L3MON4D3/LuaSnip', build = "make install_jsregexp" },
		'saadparwaiz1/cmp_luasnip',    -- Source pour les snippets (avec LuaSnip)
	},
	config = function()
		require "config.autocompletion"
	end,
}
