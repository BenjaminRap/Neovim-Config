local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = 'Telescope man pages' })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Telescope find old files' })
vim.api.nvim_set_keymap('n', '<leader>fn', ':Telescope notify<CR>', { desc = 'Telescope notify messages' })
vim.api.nvim_set_keymap('n', '<leader>fr', ':Telescope registers<CR>', { desc = 'Telescope registers' })

vim.keymap.set('n', '<leader>rff',
function()
	builtin.find_files({ cwd = vim.fn.expand('%:p:h') })
end
, { desc = 'Telescope find files relative to file cwd' })

vim.keymap.set('n', '<leader>rfg',
function()
	builtin.live_grep( { cwd = vim.fn.expand('%:p:h') } )
end
, { desc = 'Telescope live grep relative to file cwd' })

local telescope = require('telescope')
telescope.setup {
	pickers = {
		man_pages = {
			sections = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
		}
	},
	defaults = {
		file_ignore_patterns = {
			-- C / C++ / C# / Haskell (projets généraux)
			"%.o$",              -- Fichiers objets compilés
			"%.d$",              -- Fichiers dependences
			"%.a$",              -- Fichiers de bibliothèques statiques
			"%.out$",            -- Fichiers de sortie compilés
			"%.exe$",            -- Fichiers exécutables sur Windows
			"%.dll$",            -- Bibliothèques dynamiques sur Windows
			"%.lib$",            -- Bibliothèques statiques (C/C++)
			"%.dSYM/",           -- Dossiers de débogage macOS
			"%.pdb$",            -- Fichiers de débogage C#
			"%.class$",          -- Fichiers de classe Java (C# dans Unity)
			"%.obj$",            -- Fichiers objets dans les compilations C++
			"%.log$",            -- Fichiers de log
			"%.swp$",            -- Fichiers de swap de Vim
			"%.swo$",            -- Fichiers de swap de Vim
			"%.user$",           -- Paramètres spécifiques de l'utilisateur (Visual Studio)
			"%.suo$",            -- Paramètres de solution Visual Studio
			"%.vscode/",         -- Dossiers de paramètres Visual Studio Code
			"%.idea/",           -- Dossiers de configuration JetBrains
			"CMakeCache.txt",    -- Cache CMake
			"CMakeFiles/",       -- Fichiers générés par CMake

			-- Fichiers spécifiques à Unity
			"Library/",          -- Fichiers temporaires générés par Unity
			"Temp/",             -- Fichiers temporaires générés par Unity
			"obj/",              -- Répertoire des objets intermédiaires (builds)
			"UserSettings/",     -- Paramètres spécifiques à l'utilisateur dans Unity
			".vs/",              -- Dossier de Visual Studio
			"%.csproj$",         -- Fichiers de projet C# de Visual Studio
			"%.sln$",            -- Fichiers de solution Visual Studio
			"Build/",            -- Dossier contenant les builds compilés
			"%.apk$",            -- Fichiers APK générés pour Android
			"%.exe$",            -- Fichiers exécutables générés (Windows)
			"%.app$",            -- Fichiers app générés (macOS)
			"%.meta$",			 -- Fichiers meta de chaque fichiers unity

			-- Fichiers de gestion de version
			".git/",             -- Dossier Git (vérification de version)
			".gitignore",        -- Fichier d'ignore de Git
			".gitmodules",       -- Modules Git
			".svn/",             -- Dossier SVN
			".hg/",              -- Dossier Mercurial
			".bzr/",             -- Dossier Bazaar
			".vscode/",          -- Paramètres de projet VS Code
			".idea/",            -- Dossier JetBrains

			-- Fichiers temporaires et spécifiques au système
			"%.bak$",            -- Fichiers de sauvegarde
			"%.tmp$",            -- Fichiers temporaires
			"%.swp$",            -- Fichiers de swap
			"%.swo$",            -- Fichiers de swap
			"*~",
		}
	}
}
