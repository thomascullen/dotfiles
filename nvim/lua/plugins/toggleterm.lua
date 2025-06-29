return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup()

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit  = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "tab",
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>",
          { noremap = true, silent = true })
      end,
      -- function to run on closing the terminal
      on_close = function(term)
        vim.cmd("startinsert!")
      end,
    })

    function lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>gt", "<cmd>lua lazygit_toggle()<CR>",
      { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>ToggleTerm size=100 direction=vertical<CR>",
      { noremap = true, silent = true })
  end,
}
