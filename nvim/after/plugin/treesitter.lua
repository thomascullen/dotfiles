require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "rust", "graphql", "ruby", "javascript", "typescript" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
