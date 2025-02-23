return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function ()
		require("bufferline").setup({
			options = {
				mode = "tabs",
				themable = true,
				numbers = "ordinale",
				indicator = {
					style = "none"
				},
				diagnostics = "nvim_ls",
				separator_style = "slant",
				hover = {
					enabled = false
				}
			}
		})
	end
}
