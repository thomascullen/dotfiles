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
			header = '🐼 Hello',
			items = {
				starter.sections.recent_files(5, true),
			},
			footer = '',
			content_hooks = {
				starter.gen_hook.adding_bullet(),
				starter.gen_hook.aligning('center', 'center'),
			},
		})

		-- files
		local MiniFiles = require('mini.files')

		MiniFiles.setup({
			mappings = {
				go_in_plus = '<CR>'
			}
		})

		local minifiles_toggle = function()
			if not MiniFiles.close() then MiniFiles.open(vim.api.nvim_buf_get_name(0)) end
		end

		vim.keymap.set('n', '<leader>e', minifiles_toggle, { desc = 'toggle [E]xplorer' })

		local map_split = function(buf_id, lhs, direction)
			local rhs = function()
				-- Make new window and set it as target
				local new_target_window
				vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
					vim.cmd(direction .. ' split')
					new_target_window = vim.api.nvim_get_current_win()
				end)

				MiniFiles.set_target_window(new_target_window)
				MiniFiles.go_in({ close_on_file = true })
			end

			-- Adding `desc` will result into `show_help` entries
			local desc = 'Split ' .. direction
			vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
		end

		local open_root = function()
			MiniFiles.open(nil, false)
		end

		vim.api.nvim_create_autocmd('User', {
			pattern = 'MiniFilesBufferCreate',
			callback = function(args)
				local buf_id = args.data.buf_id
				-- Tweak keys to your liking
				map_split(buf_id, '<C-x>', 'belowright horizontal')
				map_split(buf_id, '<C-v>', 'belowright vertical')
				vim.keymap.set('n', '<C-r>', open_root, { buffer = buf_id, desc = 'Open [R]oot' })
			end,
		})
	end
}
