return {
  'nvim-lualine/lualine.nvim',
  priority = 20000,
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        globalstatus = true,
        component_separators = { left = '•', right = '•' }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {},
        lualine_z = {'location'}
      },
    })
  end
}
