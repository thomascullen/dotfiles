return {
  'loctvl842/monokai-pro.nvim',
  priority = 100,
  lazy = false,
  name = 'monokai-pro',
  config = function()
    require('monokai-pro').setup({
      transparent_background = false,
      filter = "ristretto",
      inc_search = "background",
      background_clear = {
        "telescope",
        "toggleterm",
      },
      override = function(c)
        return {
          Directory = { fg = "none", bg = "none" },
          TelescopeSelection = { fg = "white", bg = "#3C3434" }
        }
      end
    })

    vim.cmd('colorscheme monokai-pro')
  end,
}
