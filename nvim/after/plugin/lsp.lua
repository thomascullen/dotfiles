-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
  capabilities = capabilities
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer=0 })
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer=0 })
  vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer=0 })
  vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { buffer=0 })
  vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { buffer=0 })
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, { buffer=0 })
  vim.keymap.set("n", "K", require("lspsaga.hover").render_hover_doc, { silent = true, buffer = 0 })
  vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true, buffer = 0 })
  vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true,noremap = true, buffer = 0})
  vim.keymap.set("n", "<leader>cd", require("lspsaga.diagnostic").show_line_diagnostics, { silent = true, noremap = true, buffer = 0 })

  -- autoformat on save
  vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = 0,
      callback = function()
          vim.lsp.buf.format { async = true }
      end
  })
end

require'lspconfig'.tsserver.setup{
  on_attach = on_attach
}

-- require'lspconfig'.eslint.setup{on_attach = on_attach}

require'lspconfig'.solargraph.setup{
  on_attach = on_attach
}

local cmp = require'cmp'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- LSPSAGA
local saga = require("lspsaga")
saga.init_lsp_saga({})

local action = require("lspsaga.action")
-- scroll down hover doc or scroll in definition preview
vim.keymap.set("n", "<C-f>", function()
    action.smart_scroll_with_saga(1)
end, { silent = true })
-- scroll up hover doc
vim.keymap.set("n", "<C-b>", function()
    action.smart_scroll_with_saga(-1)
end, { silent = true })
