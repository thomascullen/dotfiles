return {
  'stevearc/conform.nvim',
  config = function()
    require('conform').setup({
      formatters_by_ft = {
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        json = { "prettierd" },
        html = { "prettierd" },
        graphql = { "prettierd" },
      },
      format_on_save = {
        timeout_ms = 800,
        lsp_fallback = true,
      },
    })
  end
}
