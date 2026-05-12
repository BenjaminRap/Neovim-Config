vim.keymap.set('n', '<leader>ne', ':Neotree toggle right<CR>', {})

require('neo-tree').setup {
	enable_git_status = true,
	enable_diagnostics = true,
	filesystem = {
		filtered_items = {
		  visible = true,
			},
		},
	window = {
		mappings = {
			['<CR>'] = 'open',
			['<space>'] = 'toggle_node',
			['a'] = 'add',
			['r'] = 'rename',
			['d'] = 'delete',
		},
	},
	event_handlers = {
		{
			event = "file_open_requested",
			handler = function()
				require("neo-tree.command").execute({ action = "close" })
			end
		},
	}
}
