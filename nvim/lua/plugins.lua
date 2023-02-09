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

require("lazy").setup({
    "rose-pine/neovim",
    "ayu-theme/ayu-vim",
    "nvim-telescope/telescope.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-treesitter/nvim-treesitter",          build = ":TSUpdate" },
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true } },
    'voldikss/vim-floaterm',
    'b3nj5m1n/kommentary',
    'sindrets/diffview.nvim',
    'vim-test/vim-test',
    'tpope/vim-fugitive',
    'nvim-tree/nvim-tree.lua',

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },

    { "kylechui/nvim-surround",    version = "*" },
    "windwp/nvim-autopairs",

    {
        "folke/which-key.nvim",
        config = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
          require("which-key").setup({
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          })
        end,
    },

})

require("nvim-autopairs").setup()
require("nvim-surround").setup()
