require("config.lazy")

if vim.g.neovide == true then
  vim.keymap.set({ "n", "x" }, "<C-S-C>", '"+y', { desc = "Copy system clipboard" })
  vim.keymap.set({ "n", "x" }, "<C-S-V>", '"+p', { desc = "Paste system clipboard" })
end

if vim.fn.has('win32') == 1 then
  vim.opt.shell = 'powershell'
  vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command'
  vim.opt.shellquote = ''
  vim.opt.shellxquote = ''
end

vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set shiftwidth=4")
vim.cmd("set tabstop=4")
vim.cmd("colorscheme tokyonight-night")

require('keybinds.pane')
require('keybinds.lazygit')
require('keybinds.tab')
require('keybinds.term')

vim.g.mapLeader = " "

vim.o.undofile = true
