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
vim.opt.autoread = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.signcolumn = 'no'

vim.opt.cursorline = true

-- vim.opt.cmdheight=0 

vim.g.mapleader = " "

vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'kj', '<Esc>')
vim.keymap.set('n', '<Leader>w', '<cmd>w <CR>')
vim.keymap.set('n', '<Leader>q', '<cmd>q <CR>')

-- paste without copying to register
vim.keymap.set('n', '<Leader>p', '\"_dP')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Make j and k work well with line wrapping
vim.opt.wrap = true
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '0', 'g0')
vim.keymap.set('n', '$', 'g$')

vim.opt.updatetime = 300
vim.opt.scrolloff = 8

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "rust", "graphql", "ruby", "javascript" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
}

-- Configure netrw
--[[ vim.g.netrw_liststyle = 3 -- show as file tree
vim.g.netrw_banner = 0 -- remove banner
vim.api.nvim_set_keymap(
  "n",
  "<Leader>e",
  ":Explore<CR>",
  { noremap = true }
) ]]
