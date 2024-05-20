return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		{ 'j-hui/fidget.nvim', opts = {} },

		-- cmp
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
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
				vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { buffer = event.buf, desc = '[O]pen [D]iagnostics' })
			end,
		})

		-- Set up nvim-cmp.
		local cmp = require 'cmp'

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
				end,
			},
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<C-j>'] = cmp.mapping.select_next_item(),
				['<C-k>'] = cmp.mapping.select_prev_item(),
				['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'vsnip' }, -- For vsnip users.
				-- { name = 'luasnip' }, -- For luasnip users.
				-- { name = 'ultisnips' }, -- For ultisnips users.
				-- { name = 'snippy' }, -- For snippy users.
			}, {
				{ name = 'buffer' },
			})
		})

		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		local default_setup = function(server)
			require('lspconfig')[server].setup({
				capabilities = capabilities
			})
		end

		require('mason').setup({})
		require('mason-lspconfig').setup({
			ensure_installed = {},
			handlers = {
				default_setup,
			},
		})
	end
}
