require("nvim-tree").setup({
  view = {
    width = 40,
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false
      }
    }
  }
})

vim.keymap.set('n', '<Leader>e', ':NvimTreeFindFileToggle<CR>')
