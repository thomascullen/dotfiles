-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'ellisonleao/gruvbox.nvim'
  use 'folke/tokyonight.nvim'
  use 'tiagovla/tokyodark.nvim'
  use 'rose-pine/neovim'

  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-telescope/telescope.nvim"
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use "neovim/nvim-lspconfig"
  use "glepnir/lspsaga.nvim"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/nvim-cmp"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"

  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"
  })

  use "nvim-treesitter/playground"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "tpope/vim-surround"

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use "windwp/nvim-ts-autotag"
  use "github/copilot.vim"
  use 'voldikss/vim-floaterm'
  use 'b3nj5m1n/kommentary'
  use 'sindrets/diffview.nvim'
  use 'vim-test/vim-test'
  use 'tpope/vim-fugitive'
  use 'kyazdani42/nvim-tree.lua'

  -- local
  use '~/Developer/kidogo.nvim'
end)
