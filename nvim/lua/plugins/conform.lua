return {
  'stevearc/conform.nvim',
  config = function()
    require('conform').setup({
      default_format_opts = {
        timeout_ms = 3000,
        async = false,           -- not recommended to change
        quiet = false,           -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
      },
      formatters_by_ft = {
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        json = { "prettierd" },
        html = { "prettierd" },
        graphql = { "prettierd" },
        markdown = { "prettierd" },
        mdx = { "prettierd" },
      },
      format_on_save = {
        timeout_ms = 800,
        lsp_fallback = true,
      },
    })
  end
}
