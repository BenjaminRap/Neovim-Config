return {
	"lalitmee/browse.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("config.browse")
	end
}
