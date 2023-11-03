return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'jose-elias-alvarez/null-ls.nvim' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
  },
  config = function()
    local lsp = require('lsp-zero')

    lsp.on_attach(function(lient, bufnr)
      lsp.default_keymaps({ buffer = bufnr })
    end)

    require('mason').setup({})
    require('mason-lspconfig').setup({
      handlers = {
        lsp.default_setup,
      },
    })

    local cmp = require('cmp')
    cmp.setup({
      window = {
        border = "rounded",
      },
      completion = {
        border = "rounded",
      },
      mapping = {
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
      }
    })
  end
}
