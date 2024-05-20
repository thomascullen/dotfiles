return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	opts = {
		dim_inactive_windows = false,
		extend_background_behind_borders = true,
		highlight_groups = {
			NvimTreeNormal = { bg = "surface" },
			WinSeparator = { fg = "overlay" },
			LineNr = { fg = 'highlight_high' },
			LineNrAbove = { fg = 'highlight_med' },
			LineNrBelow = { fg = 'highlight_med' },
			NonText = { fg = 'base' },
			FloatBorder = { bg = 'base', fg = 'foam' },
		}
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd [[colorscheme rose-pine]]
	end
}
