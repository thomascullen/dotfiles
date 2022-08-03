local last_tabpage = vim.api.nvim_get_current_tabpage()

function DiffviewToggle()
  local lib = require'diffview.lib'
  local view = lib.get_current_view()
  if view then
    vim.cmd(":DiffviewClose")
  else
    vim.cmd(":DiffviewOpen")
  end
end

vim.keymap.set('n', '<Leader>dv', DiffviewToggle)
