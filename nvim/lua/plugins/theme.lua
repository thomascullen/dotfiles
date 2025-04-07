return {
  "zenbones-theme/zenbones.nvim",
  -- Optionally install Lush. Allows for more configuration or extending the colorscheme
  -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
  -- In Vim, compat mode is turned on as Lush only works in Neovim.
  dependencies = "rktjmp/lush.nvim",
  lazy = false,
  priority = 1000,
  -- you can set set configuration options here
  config = function()
    vim.g.rosebones_darkness = 'stark'
    vim.cmd.colorscheme('rosebones')
  end
}
--
-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {
-- 		dim_inactive_windows = false,
-- 		extend_background_behind_borders = true,
-- 		highlight_groups = {
-- 			WinSeparator = { fg = "overlay" },
-- 			LineNr = { fg = 'highlight_high' },
-- 			LineNrAbove = { fg = 'highlight_med' },
-- 			LineNrBelow = { fg = 'highlight_med' },
-- 			NonText = { fg = 'base' },
-- 			FloatBorder = { bg = 'base', fg = 'foam' },
-- 		},
-- 		styles = {
-- 			transparency = true,
-- 		}
-- 	},
-- 	config = function(_, opts)
-- 		require("rose-pine").setup(opts)
-- 		vim.cmd [[colorscheme rose-pine]]
-- 	end
-- }
