return {
  "EdenEast/nightfox.nvim",
  config = function()
    require("nightfox").setup({
      options = {
        transparent = true,
        styles = {
          comments = "italic",
          keywords = "bold,italic",
        },
      },
    })
    vim.cmd("colorscheme carbonfox")
  end,
}
