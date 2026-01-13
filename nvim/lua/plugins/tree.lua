return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file tree' })
    require("nvim-tree").setup {}
  end,
}
