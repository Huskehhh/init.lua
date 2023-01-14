require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "rust", "python", "cpp", "cmake" },
  sync_install = false,

  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
