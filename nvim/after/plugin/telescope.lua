
local actions = require("telescope.actions")
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      grouped = true,
      mappings = {
        ["n"] = {
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
        },
      },
    },
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  },
  defaults = {
    prompt_prefix = "-> ",
    layout_config = {
      prompt_position = "top",
    },
    mappings = {
      n = {
        ["<Leader>p"] = actions.close,
      },
      i = {
        ["<Leader>p"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
  }
}

require('telescope').load_extension('fzf')
-- require("telescope").load_extension "file_browser"

vim.keymap.set('n', '<Leader>p', ':Telescope find_files<CR>')
vim.keymap.set('n', '<Leader>s', ':Telescope live_grep<CR>')

--[[ vim.api.nvim_set_keymap(
  "n",
  "<Leader>e",
  ":Telescope file_browser<CR>",
  { noremap = true }
) ]]
