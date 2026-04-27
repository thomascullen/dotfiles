return {
  "shatur/neovim-ayu",
  config = function()
    require("ayu").setup({})
    require('ayu').colorscheme()
  end
}
