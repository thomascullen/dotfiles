return {
  "phaazon/hop.nvim",
  branch = 'v2',
  keys = {
    { "<Leader>hw", "<cmd>HopWord<CR>" },
    { "<Leader>hc", "<cmd>HopChar<CR>" },
    { "<Leader>hl", "<cmd>HopLine<CR>" },
  },
  config = function()
    require'hop'.setup { 
      keys = 'etovxqpdygfblzhckisuran'
    }
  end
}
