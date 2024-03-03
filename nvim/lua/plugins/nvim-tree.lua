-- return {
-- 	"nvim-tree/nvim-tree.lua",
-- 	lazy = false,
-- 	dependencies = {
-- 		'nvim-tree/nvim-web-devicons'
-- 	},
-- 	keys = {
-- 		{ "<Leader>e", "<cmd>NvimTreeFindFileToggle<CR>" }
-- 	},
-- 	config = function()
-- 		vim.g.loaded_netrw = 1
-- 		vim.g.loaded_netrwPlugin = 1
--
-- 		require("nvim-tree").setup {
-- 			view = {
-- 				width = 50,
-- 			}
-- 		}
-- 	end
-- }

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set('n', '<Leader>e', '<cmd>Neotree toggle float focus<CR>')
	end
}
