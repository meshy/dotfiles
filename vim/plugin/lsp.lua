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

-- Attach to all LSP clients.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local bufnr = ev.buf
    on_attach(client, bufnr)
  end,
})


vim.lsp.enable('pyright')


vim.lsp.config('pylsp', {
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
vim.lsp.enable('pylsp')

vim.lsp.config('*', {
  root_markers = { '.git' },
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
