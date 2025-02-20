vim.keymap.set('n', '<leader>e', ':Neotree toggle right<CR>', {})

require('neo-tree').setup {
	filesystem = {
		filtered_items = {
		  visible = true,  -- Assurer la visibilité de tous les fichiers
			},
		},
	window = {
		mappings = {
			['l'] = 'open',        -- Ouvrir un fichier avec 'l'
			['h'] = 'close_node',  -- Fermer un fichier/dossier avec 'h'
			['o'] = 'create',      -- Créer un fichier avec 'o'
			['d'] = 'delete',      -- Supprimer un fichier avec 'd'
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
