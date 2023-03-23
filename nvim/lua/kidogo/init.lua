local M = {}

function M.setup(config)
end

M.load = function()
  -- reset colors
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  local groups = require("kidogo.groups")
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
