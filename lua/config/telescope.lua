local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = 'Telescope man pages' })

vim.keymap.set('n', '<leader>rff',
function()
	builtin.find_files({ cwd = vim.fn.expand('%:p:h') })
end
, { desc = 'Telescope find files' })

vim.keymap.set('n', '<leader>rfg',
function()
	builtin.live_grep( { cwd = vim.fn.expand('%:p:h') } )
end
, { desc = 'Telescope live grep' })

local telescope = require('telescope')
telescope.setup {
  pickers = {
    man_pages = {
      sections = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
    }
  }
}
