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
      files.open(vim.api.nvim_buf_get_name(0), false)
    end, { desc = 'toggle [E]xplorer' })

    vim.keymap.set('n', '<leader>o', function()
      files.open(nil, false)
    end, { desc = 'toggle [F]iles' })

    local map_split = function(buf_id, lhs, direction)
      local rhs = function()
        -- Make new window and set it as target
        local cur_target = files.get_explorer_state().target_window
        local new_target = vim.api.nvim_win_call(cur_target, function()
          vim.cmd(direction .. ' split')
          return vim.api.nvim_get_current_win()
        end)

        files.set_target_window(new_target)
        files.go_in({
          close_on_file = true
        })

        -- This intentionally doesn't act on file under cursor in favor of
        -- explicit "go in" action (`l` / `L`). To immediately open file,
        -- add appropriate `MiniFiles.go_in()` call instead of this comment.
      end

      -- Adding `desc` will result into `show_help` entries
      local desc = 'Split ' .. direction
      vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id
        -- Tweak keys to your liking
        map_split(buf_id, '<C-s>', 'belowright horizontal')
        map_split(buf_id, '<C-v>', 'belowright vertical')
        map_split(buf_id, '<C-t>', 'tab')
      end,
    })

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
