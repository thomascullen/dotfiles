require("plugins")

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.signcolumn = 'no'

vim.opt.cursorline = true

vim.opt.cmdheight=0 

vim.g.mapleader = " "

vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<Leader>w', '<cmd>w <CR>')
