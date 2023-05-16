return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    local keymap = vim.keymap.set
    require("lspsaga").setup({})

    keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
    keymap("n", "<leader>gl", "<cmd>Lspsaga show_line_diagnostics<CR>")
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
  end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter" }
  }
}
