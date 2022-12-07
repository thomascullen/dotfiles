-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'rose-pine/neovim'
  use 'ellisonleao/gruvbox.nvim'
  use 'folke/tokyonight.nvim'
  use '~/Developer/kidogo.nvim'

  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"
  })

  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"
  use "glepnir/lspsaga.nvim"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/nvim-cmp"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "jose-elias-alvarez/null-ls.nvim"
  use 'simrat39/rust-tools.nvim'

  -- use "nvim-treesitter/playground"
  -- use "nvim-telescope/telescope-file-browser.nvim"
  use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  })
  -- use "github/copilot.vim"
  use 'voldikss/vim-floaterm'
  use 'b3nj5m1n/kommentary'
  use 'sindrets/diffview.nvim'
  use 'vim-test/vim-test'
  use 'tpope/vim-fugitive'
  use 'nvim-tree/nvim-tree.lua'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
end)
