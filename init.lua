require("config.lazy")

vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set shiftwidth=4")
vim.cmd("set tabstop=4")

vim.g.mapLeader = " "

vim.cmd.colorscheme "catppuccin"

-- move from a tab to another
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', { noremap = true, silent = true})

-- Resize the current window
vim.api.nvim_set_keymap('n', '<A-->', '<C-w>-', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-=>', '<C-w>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-,>', '<C-w>>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-.>', '<C-w><', { noremap = true, silent = true})

-- Move from a terminal to another tab
vim.api.nvim_set_keymap('t', '<leader>k', '<C-\\><C-n><C-w>k', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<leader>j', '<C-\\><C-n><C-w>j', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<leader>h', '<C-\\><C-n><C-w>h', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<leader>l', '<C-\\><C-n><C-w>l', { noremap = true, silent = true})

-- Close or open the term
vim.api.nvim_set_keymap('t', '<leader>t', '<C-\\><C-n>:ToggleTerm<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>t', ':ToggleTerm<CR>', { noremap = true, silent = true})

-- Go into vim mode in the terminal
vim.api.nvim_set_keymap('t', '<leader><Esc>', '<C-\\><C-n>', { noremap = true, silent = true})

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
