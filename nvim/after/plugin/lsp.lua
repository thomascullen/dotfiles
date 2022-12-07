require("mason").setup()
require("mason-lspconfig").setup()

local cmp = require'cmp'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})


-- Setup lspconfig.
local lspconfig = require("lspconfig");
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
  capabilities = capabilities

  client.server_capabilities.document_formatting = false
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer=bufnr })
end

lspconfig.tsserver.setup {on_attach = on_attach}
lspconfig.solargraph.setup {on_attach = on_attach }

-- Rust
local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- null-ls
local null_ls = require("null-ls");
local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
null_ls.setup({
  sources = {
    -- null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.code_actions.eslint,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.rubocop,
  },
  on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                  -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                  vim.lsp.buf.format({ bufnr = bufnr })
              end,
          })
      end
  end,
})

-- LSPSAGA
local saga = require("lspsaga")
saga.init_lsp_saga({})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "<C-p>", "<cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("n", "<leader>r", "<cmd>Lspsaga rename<CR>", opts)

-- Show diagnostics in float window
vim.cmd([[au CursorHold * lua vim.diagnostic.open_float(0,{scope = "cursor"})]])
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  float = { border = "single" },
})
