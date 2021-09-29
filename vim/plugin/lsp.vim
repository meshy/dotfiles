lua << EOF
nvim_lsp = require("lspconfig")


local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)


  local signs = {
    LspDiagnosticsSignError = " ",
    LspDiagnosticsSignWarning = " ",
    LspDiagnosticsSignHint = " ",
    LspDiagnosticsSignInformation = " "
  }

  for hl, icon in pairs(signs) do
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end



nvim_lsp.pylsp.setup({
  enable = true,
  on_attach = on_attach,
  settings = {
    pylsp = {
      configurationSources = {"pyls-flake8"},
      plugins = {
        pyls_flake8 = {enabled = true},
        jedi_completion = {fuzzy = true}
      }
    }
  }
})
EOF
