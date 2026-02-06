return {
  "Shatur/neovim-ayu",
  config = function()
    require("ayu").setup({})
    vim.cmd.colorscheme("ayu")
  end
}
