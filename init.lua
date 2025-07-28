require("config.lazy")

local in_wsl = vim.fn.has("wsl") == 1

if in_wsl then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank -i --crlf",
      ["*"] = "win32yank -i --crlf",
    },
    paste = {
      ["+"] = "win32yank -o --lf",
      ["*"] = "win32yank -o --lf",
    },
    cache_enabled = false,
  }
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
