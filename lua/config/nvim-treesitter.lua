local configs = require("nvim-treesitter.configs")
configs.setup({
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
		"regex",
		"bash",
		"haskell"
	},
	highlight = { enable = true },
	indent = { enable = true },
})
