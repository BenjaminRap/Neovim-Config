-- Close or open the term
vim.api.nvim_set_keymap('t', '<C-t>', '<C-\\><C-n>:ToggleTerm<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-t>', ':ToggleTerm<CR>', { noremap = true, silent = true})

-- Go into vim mode in the terminal
vim.api.nvim_set_keymap('t', '<leader><Esc>', '<C-\\><C-n>', { noremap = true, silent = true})
