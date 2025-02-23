function OpenLazygitInTab()
	vim.cmd("tabnew")  -- Ouvre un nouvel onglet
	vim.cmd("term lazygit")  -- Ouvre LazyGit dans un terminal
	vim.cmd("startinsert")  -- Met le terminal en mode insertion automatiquement
end

-- Associer la fonction à un raccourci clavier (par exemple : <leader>g)
vim.keymap.set("n", "<leader>l", OpenLazygitInTab, { noremap = true, silent = true })
