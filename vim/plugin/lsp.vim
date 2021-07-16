lua << EOF
nvim_lsp = require("lspconfig")
nvim_lsp.pylsp.setup({
  enable = true,
  settings = {
    pylsp = {
      configurationSources = {"pyls-flake8"},
      plugins = {
        flake8 = {enabled = true},
        pyls_flake8 = {enabled = true},
        jedi_completion = {fuzzy = true}
      }
    }
  }
})
EOF
