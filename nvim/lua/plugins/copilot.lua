return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
  },
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<tab>"
        }
      },
      nes = {
        enabled = true, -- Enable the NES functionality
        auto_trigger = true,
        keymap = {
          accept_and_goto = "<tab>",
        },
      },
    })
  end,
}
