return {
  "glepnir/lspsaga.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter" }
  },
  config = function()
    local keymap = vim.keymap.set
    require("lspsaga").setup({
      diagnostic = {
        keys = {
          quit = { 'q', '<ESC>' }
        }
      }
    })

    keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
    keymap("n", "<leader>gl", "<cmd>Lspsaga show_line_diagnostics<CR>")
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
    keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
    keymap("n", "<leader>dn", "<cmd>Lspsaga diagnostic_jump_next<CR>")
    keymap("n", "<leader>dp", "<cmd>Lspsaga diagnostic_jump_previous<CR>")
  end,
}
