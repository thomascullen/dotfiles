return {
  "esmuellert/codediff.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "CodeDiff",
  lazy = false,
  config = function()
    vim.keymap.set('n', '<Leader>dv', ':CodeDiff<CR>')
  end
}
