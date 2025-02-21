require("config.lazy")

vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set shiftwidth=4")
vim.cmd("set tabstop=4")

require('keybinds.pane')
require('keybinds.tab')
require('keybinds.init-file')
require('keybinds.term')

vim.g.mapLeader = " "

vim.cmd.colorscheme "catppuccin"
