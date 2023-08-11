return {
  'loctvl842/monokai-pro.nvim',
  name = 'monokai-pro',
  config = function()
    require('monokai-pro').setup({
      filter = "ristretto",
      background_clear = {
        "telescope"
      },
    })

    vim.cmd('colorscheme monokai-pro')
  end
}
