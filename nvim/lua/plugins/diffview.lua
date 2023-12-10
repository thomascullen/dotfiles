return {
	"sindrets/diffview.nvim",
	config = function()
		function DiffviewToggle()
			local lib = require 'diffview.lib'
			local view = lib.get_current_view()
			if view then
				vim.cmd(":DiffviewClose")
			else
				vim.cmd(":DiffviewOpen")
			end
		end

		vim.keymap.set('n', '<Leader>dv', DiffviewToggle)
	end
}
