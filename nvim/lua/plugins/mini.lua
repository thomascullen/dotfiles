return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.ai").setup()
    require("mini.move").setup()
    require("mini.pairs").setup()
    require("mini.comment").setup()
    require("mini.surround").setup()

    -- local statusline = require 'mini.statusline'
    -- statusline.setup()

    local starter = require('mini.starter')

    starter.setup({
      header = '🐼 Hello',
      items = {
        starter.sections.recent_files(5, true),
      },
      footer = '',
      content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.aligning('center', 'center'),
      },
    })
  end
}
