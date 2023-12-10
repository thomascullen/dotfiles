return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v3.x',
	dependencies = {
		'neovim/nvim-lspconfig',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',

		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',

		-- Automatically install LSPs to stdpath for neovim
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',

		-- Useful status updates for LSP
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ 'j-hui/fidget.nvim', opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		'folke/neodev.nvim',

		-- Mmmm lasagne
		'nvimdev/lspsaga.nvim',
	},
	config = function()
		require('lspsaga').setup({})

		local zero = require('lsp-zero')
		zero.on_attach(function(client, bufnr)
			zero.default_keymaps({ buffer = bufnr })
		end)

		require('mason').setup()
		require('mason-lspconfig').setup({
			ensure_installed = {},
			handlers = {
				zero.default_setup,
			},
		})

		require('neodev').setup()

		-- setup cmp
		local cmp = require 'cmp'
		local luasnip = require 'luasnip'

		require('luasnip.loaders.from_vscode').lazy_load()
		luasnip.config.setup {}

		cmp.setup({
			window = {
				border = "rounded",
			},
			completion = {
				border = "rounded",
			},
			mapping = {
				['<C-j>'] = cmp.mapping.select_next_item(),
				['<C-k>'] = cmp.mapping.select_prev_item(),
				['<CR>'] = cmp.mapping.confirm({ select = false }),
			},
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'path' },
				{ name = 'luasnip' },
			},
		})

		-- setup lspsaga
		local keymap = vim.keymap.set
		keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
		keymap("n", "<leader>gl", "<cmd>Lspsaga show_line_diagnostics<CR>")
		keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
		keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
		keymap("n", "gpd", "<cmd>Lspsaga peek_definition<CR>")
	end
}
