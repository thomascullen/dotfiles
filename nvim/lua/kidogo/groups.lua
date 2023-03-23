local colors = require("kidogo.colors")

local M = {
  Normal = { fg = colors.white, bg = colors.background },
  CursorLine = { bg = colors.background },
  ["@function"] = { fg = colors.color2 },
  ["@keyword"] = { fg = colors.color1 },
  ["@keyword.function"] = { fg = colors.color1 },
  ["@operator"] = { fg = colors.subtle },
  ["@punctuation"] = { fg = colors.subtle },
  ["@parameter"] = { fg = colors.color3 },
  ["@variable"] = { fg = colors.white },
  ["@tag"] = { fg = colors.color4 },
  ["@tag.attribute"] = { fg = colors.color3 },
  ["@tag.delimiter"] = { fg = colors.subtle },
}

return M
