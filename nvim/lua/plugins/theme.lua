return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	opts = {
		dim_inactive_windows = false,
		extend_background_behind_borders = true,
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd [[colorscheme rose-pine]]
	end
}
