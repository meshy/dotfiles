require'nvim-treesitter.configs'.setup {
  -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "go",
    "html",
    "javascript",
    "json",
    "kotlin",
    "lua",
    "make",
    "python",
    "rst",
    "rust",
    "scss",
    "toml",
    "typescript",
    "vim",
    "vue",
  },
  highlight = {
    additional_vim_regex_highlighting = false,
  },
  indent = {
    disable = {"python", },
  },
}
