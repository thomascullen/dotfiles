return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { "<Leader>p",  "<cmd>Telescope find_files<CR>" },
    { "<Leader>o",  "<cmd>Telescope oldfiles<CR>" },
    { "<Leader>h",  "<cmd>Telescope help_tags<CR>" },
    { "<Leader>a",  "<cmd>Telescope lsp_document_symbols<CR>" },
    { "<Leader>gb", "<cmd>Telescope git_branches<CR>" },
    { "<Leader>gc", "<cmd>Telescope git_commits<CR>" },
    { "<Leader>gn", "<cmd>Telescope git_status<CR>" },
    { "<Leader>s", "<cmd>Telescope live_grep<CR>" },
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
            ["<C-h>"] = "which_key"
          },
          i = {
            ["<C-h>"] = "which_key",
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
      }
    })
  end
}
