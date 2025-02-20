return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("config.miniFiles")
		require("mini.pairs").setup()
		require("mini.move").setup()
		require("mini.icons").setup()
	end
}
