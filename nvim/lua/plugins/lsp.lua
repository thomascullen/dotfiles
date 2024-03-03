return {
	'neovim/nvim-lspconfig',
	dependencies = {
		-- cmp
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
		'L3MON4D3/LuaSnip',

		-- Automatically install LSPs and related tools to stdpath for neovim
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',

		-- Useful status updates for LSP.
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ 'j-hui/fidget.nvim', opts = {} },
	},
	config = function()
		-- LspAttach is called when an LSP attaches to a buffer
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
			callback = function(event)
				-- Setup fidget
				require('fidget').setup({})

				local ts = require 'telescope.builtin'

				-- Jump to the definition of the word under your cursor.
				vim.keymap.set('n', 'gd', ts.lsp_definitions, { buffer = event.buf, desc = '[G]oto [D]efinition' })
				-- Find references for the word under your cursor.
				vim.keymap.set('n', 'gr', ts.lsp_references, { buffer = event.buf, desc = '[G]oto [R]eferences' })
				-- Jump to the type of the word under your cursor.
				vim.keymap.set('n', '<leader>D', ts.lsp_type_definitions, { buffer = event.buf, desc = '[G]oto [T]ype' })
				-- Fuzzy find all the symbols in your current document.
				vim.keymap.set('n', '<leader>ds', ts.lsp_document_symbols,
					{ buffer = event.buf, desc = '[G]oto [D]ocument [S]ymbols' })
				-- code action
				vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = event.buf, desc = '[C]ode [A]ctions' })
				-- documentation hover
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = event.buf, desc = '[H]over [D]ocumentation' })
			end,
		})

		-- Setup mason
		local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

		local default_setup = function(server)
			require('lspconfig')[server].setup({
				capabilities = lsp_capabilities,
			})
		end

		require('mason').setup({})
		require('mason-lspconfig').setup({
			ensure_installed = {},
			handlers = {
				default_setup,
			},
		})

		-- setup cmp
		local cmp = require 'cmp'

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
	end
}
