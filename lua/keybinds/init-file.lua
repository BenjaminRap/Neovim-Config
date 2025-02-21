-- Go to the init.lua file
vim.keymap.set('n', '<leader>i', function()
    if vim.fn.has("win64") == 1 then
	vim.api.nvim_command(":e ~/AppData/Local/nvim/init.lua")
	end
    if vim.fn.has("unix") == 1 then
	vim.api.nvim_command(":e ~/.config/nvim/init.lua")
    end
end
)
