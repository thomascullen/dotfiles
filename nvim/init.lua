vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.relativenumber = true
vim.o.termguicolors = true
vim.opt.cmdheight = 0
-- Indent
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.swapfile = false
-- Set highlight on search
vim.o.hlsearch = false
-- Make line numbers default
vim.wo.number = true
-- Sync clipboard with OS
vim.o.clipboard = 'unnamedplus'
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.o.undofile = true
-- Turn off sign column
vim.wo.signcolumn = 'no'
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300
-- Enable break indent
vim.o.breakindent = true
-- Make j and k work well with line wrapping
vim.opt.wrap = true
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '0', 'g0')
vim.keymap.set('n', '$', 'g$')
-- kj for quick escape
vim.keymap.set('i', 'kj', '<Esc>')
-- quick write
vim.keymap.set('n', '<Leader>w', '<cmd>w <CR>')


-- Install Lazy plugin manager
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

-- Load plugins from folder
require("lazy").setup("plugins")
