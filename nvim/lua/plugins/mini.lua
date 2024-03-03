return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.move").setup()
		require("mini.pairs").setup()
		require("mini.comment").setup()
		require("mini.surround").setup()

		local statusline = require 'mini.statusline'
		statusline.setup()

		local starter = require('mini.starter')

		starter.setup({
			footer = '',
			items = {
				starter.sections.recent_files(10, true),
			}
		})
	end
}
