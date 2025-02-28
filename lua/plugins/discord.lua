return {
	"andweeb/presence.nvim",
	config = function ()
		require("presence").setup({
			neovim_image_text = "Neovim ❤️",
			main_image = "neovim",
			enable_line_number = true,
			show_time = true,
		})
	end
}
