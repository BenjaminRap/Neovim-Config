require("nvim-treesitter").setup({
	ensure_installed = {
		"lua",
		"c",
		"cpp",
		"c_sharp",
		"javascript",
		"css",
		"python",
		"vimdoc",
		"markdown",
		"markdown_inline",
		"regex",
		"bash",
		"haskell",
		"html",
		"typescript",
		"glsl"
	},
	highlight = { enable = true },
	indent = { enable = true },
})
