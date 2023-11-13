vim.g.mapleader = " "
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.signcolumn = 'no'
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.background = 'dark'
vim.opt.cmdheight = 0
vim.opt.laststatus = 3

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('i', 'kj', '<Esc>')
vim.keymap.set('n', '<Leader>w', '<cmd>w <CR>')
vim.keymap.set('n', '<Leader>q', '<cmd>X <CR>')
vim.keymap.set('n', '<Leader><Leader>q', '<cmd>qa! <CR>')

-- keep cursor in center of screen for ctrl-d and ctrl-u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in center when jumping between search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- quick list
vim.keymap.set("n", "<Leader>qn", ":cnext<CR>")
vim.keymap.set("n", "<Leader>qp", ":cprev<CR>")

-- quier mark jumping
vim.keymap.set("n", "<Leader>m", "`")

-- Make j and k work well with line wrapping
vim.opt.wrap = true
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '0', 'g0')
vim.keymap.set('n', '$', 'g$')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
