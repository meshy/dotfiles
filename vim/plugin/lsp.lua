nvim_lsp = require("lspconfig")


local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)


  vim.diagnostic.config {
    virtual_text = { prefix = "" },
    signs = { text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " "
    } },
    underline = true,
    float = { border = "single" },
  }
end


nvim_lsp.pyright.setup {
  on_attach = on_attach,
}

nvim_lsp.pylsp.setup({
  enable = true,
  on_attach = on_attach,
  settings = {
    pylsp = {
      configurationSources = {},
      plugins = {
        pylint = {enabled = true},
        -- jedi = {environment = get_python_path()},
        jedi_completion = {fuzzy = true}
      }
    }
  }
})

-- Change symbol in front on inline diagnostics.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    prefix = '●',
  }
})

-- Display source of diagnostics.
vim.diagnostic.config({
  virtual_text = { source = "always" },
  float = { source = "always" },
})
