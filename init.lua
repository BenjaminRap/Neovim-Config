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

_G.compact_quickfix_list = function(info)
    local items = vim.fn.getqflist({id = info.id, items = 1}).items
    local l = {}
    for i = info.start_idx, info.end_idx do
        local item = items[i]
        -- bufname récupère le chemin, fnamemodify(..., ':t') extrait le nom seul
        local fname = vim.fn.fnamemodify(vim.fn.bufname(item.bufnr), ':t')
        -- On formate : le nom du fichier (tronqué/espacé à 15 car.) | le texte
        local line = string.format("%-15s | %s", fname, item.text)
        table.insert(l, line)
    end
    return l
end

vim.o.quickfixtextfunc = "v:lua.compact_quickfix_list"
