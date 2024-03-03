return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
		{ 'nvim-telescope/telescope-ui-select.nvim' },
	},
	config = function()
		local actions = require("telescope.actions")

		require('telescope').setup({
			defaults = {
				prompt_prefix = "-> ",
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
				},
				mappings = {
					n = {
						["q"] = actions.close,
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
					},
					i = {
						["<Esc>"] = actions.close,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
				},
			},
			extensions = {
				['ui-select'] = {
					require('telescope.themes').get_dropdown(),
				},
			},
		})

		require('telescope').load_extension('fzf')
		require('telescope').load_extension('ui-select')

		local builtin = require 'telescope.builtin'
		vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
		vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
		vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
		vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
		vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
		vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
		vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
		vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

		-- Shortcut for searching your neovim configuration files
		vim.keymap.set('n', '<leader>sn', function()
			builtin.find_files { cwd = vim.fn.stdpath 'config' }
		end, { desc = '[S]earch [N]eovim files' })
	end
}
