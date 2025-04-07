return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.ai").setup()
    require("mini.move").setup()
    require("mini.pairs").setup()
    require("mini.comment").setup()
    require("mini.surround").setup()

    -- Files
    local files = require("mini.files")
    files.setup()

    vim.keymap.set('n', '<leader>e', function()
      files.open(nil, false)
    end, { desc = 'toggle [E]xplorer' })

    vim.keymap.set('n', '<leader>f', function()
      files.open(vim.api.nvim_buf_get_name(0), false)
    end, { desc = 'toggle [F]iles' })

    -- Status line
    local statusline = require 'mini.statusline'
    statusline.setup()

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
