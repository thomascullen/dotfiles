return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    "j-hui/fidget.nvim" -- provides tooltips in the bottom right on startup
  },
  config = function()
    require("fidget").setup()

    -- LspAttach is called when an LSP attaches to a buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local ts = require 'telescope.builtin'

        -- Jump to the definition of the word under your cursor.
        vim.keymap.set('n', 'gd', ts.lsp_definitions, { buffer = event.buf, desc = '[G]oto [D]efinition' })
        -- Find references for the word under your cursor.
        vim.keymap.set('n', 'gr', ts.lsp_references, { buffer = event.buf, desc = '[G]oto [R]eferences' })
        -- Jump to the type of the word under your cursor.
        vim.keymap.set('n', '<leader>D', ts.lsp_type_definitions, { buffer = event.buf, desc = '[G]oto [T]ype' })
        -- Fuzzy find all the symbols in your current document.
        vim.keymap.set('n', '<leader>ds', ts.lsp_document_symbols,
          { buffer = event.buf, desc = '[G]oto [D]ocument [S]ymbols' })
        -- code action
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = event.buf, desc = '[C]ode [A]ctions' })
        -- documentation hover
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = event.buf, desc = '[H]over [D]ocumentation' })
        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { buffer = event.buf, desc = '[O]pen [D]iagnostics' })
      end,
    })

    require('mason').setup()
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup()
  end
}
