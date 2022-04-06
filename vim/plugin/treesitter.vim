lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    additional_vim_regex_highlighting = false,
  },
  indent = {
    disable = {"python", },
  },
}
EOF
