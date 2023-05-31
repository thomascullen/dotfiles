return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-file-browser.nvim",
  },
  keys = {
    { "<Leader>p", "<cmd>Telescope find_files<CR>" },
    { "<Leader>s", "<cmd>Telescope live_grep<CR>" },
    { "<Leader>e", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>" },
  },
  config = function()
    local actions = require("telescope.actions")

    require('telescope').setup({
      extensions = {
        file_browser = {
          grouped = true,
          initial_mode = "normal",
        },
      },
      defaults = {
        prompt_prefix = "-> ",
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
        },
        mappings = {
          n = {
            ["q"] = actions.close,
            ["<Leader>p"] = actions.close,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
          },
          i = {
            ["<Esc>"] = actions.close,
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
    })

    require("telescope").load_extension("file_browser")
  end
}
