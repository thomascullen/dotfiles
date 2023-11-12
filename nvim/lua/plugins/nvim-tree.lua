return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  keys = {
    { "<Leader>e", "<cmd>NvimTreeFindFileToggle<CR>" }
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup {
      view = {
        width = 50,
      }
    }
  end
}
