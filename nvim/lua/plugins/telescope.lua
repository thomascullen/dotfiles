return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "ahmedkhalf/project.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  keys = {
    { "<Leader>p", "<cmd>Telescope find_files<CR>" },
    { "<Leader>o", "<cmd>Telescope oldfiles<CR>" },
    { "<Leader>a", "<cmd>Telescope lsp_document_symbols<CR>" },
    { "<Leader>gb", "<cmd>Telescope git_branches<CR>" },
    { "<Leader>gc", "<cmd>Telescope git_commits<CR>" },
    { "<Leader>gn", "<cmd>Telescope git_status<CR>" },
    { "<Leader>s", "<cmd>Telescope live_grep<CR>" },
    { "<Leader>e", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>" },
  },
  config = function()
    local actions = require("telescope.actions")
    local fb_actions = require("telescope").extensions.file_browser.actions

    require('telescope').setup({
      extensions = {
        file_browser = {
          grouped = true,
          initial_mode = "normal",
          display_stat = false
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
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["<C-c>"] = fb_actions.create,
            ["<C-k>"] = fb_actions.goto_parent_dir,
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
        },
      }
    })

    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("projects")
  end
}
