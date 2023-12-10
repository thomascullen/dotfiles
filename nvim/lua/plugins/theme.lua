return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
		styles = {
			floats = "transparent",
			sidebar = "transparent",
		},
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd [[colorscheme tokyonight]]
	end
}
