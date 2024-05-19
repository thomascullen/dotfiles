return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup()
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

		require("mini.completion").setup()

		-- use ctrl j + k to navigate list
		vim.keymap.set('i', '<C-j>', '<C-n>', { noremap = true, silent = true })
		vim.keymap.set('i', '<C-k>', '<C-p>', { noremap = true, silent = true })
	end
}
