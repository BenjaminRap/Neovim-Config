-- move from a pane to another
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true})

-- Move from a terminal to another pane
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true})

-- Resize the current pane
vim.api.nvim_set_keymap('n', '<A-->', '<C-w>3-', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-=>', '<C-w>3+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-,>', '<C-w>3>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-.>', '<C-w>3<', { noremap = true, silent = true})
