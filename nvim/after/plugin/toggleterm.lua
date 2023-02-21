vim.g['test#strategy'] = 'floaterm'
vim.keymap.set('n', '<leader><leader>t', '<cmd>FloatermToggle<CR>', { silent = true })
vim.keymap.set('t', '<leader><leader>t', '<cmd>FloatermToggle<CR>', { silent = true })

local toggleterm = require("toggleterm")

toggleterm.setup {
  size = 80,
  direction = 'vertical',
  open_mapping = [[<A-d>]],
}
