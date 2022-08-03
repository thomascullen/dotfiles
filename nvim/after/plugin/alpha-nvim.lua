 local alpha = require'alpha'
 local dashboard = require'alpha.themes.dashboard'

 dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

dashboard.section.buttons.val = {
  dashboard.button( "f", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
  dashboard.button( "r", "  Recent"   , ":Telescope oldfiles<CR>"),
  dashboard.button( "q", "  Quit NVIM", ":qa<CR>"),
}

 --[[ dashboard.section.footer.val = {
  "                       ",
  "           😀          ",
  "                       ",
} ]]

alpha.setup(dashboard.config)
