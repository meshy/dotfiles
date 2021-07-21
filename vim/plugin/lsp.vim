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

local util = require('lspconfig/util')

local path = util.path

-- From https://github.com/neovim/nvim-lspconfig/issues/500#issuecomment-876700701
-- Used with https://github.com/python-lsp/python-lsp-server/issues/29#issuecomment-882161177
local function get_python_path()
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Fallback to system Python.
  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end


nvim_lsp.pylsp.setup({
  enable = true,
  on_attach = on_attach,
  settings = {
    pylsp = {
      configurationSources = {"pyls-flake8"},
      plugins = {
        flake8 = {enabled = true},
        pyls_flake8 = {enabled = true},
        jedi = {environment = get_python_path()},
        jedi_completion = {fuzzy = true}
      }
    }
  }
})
EOF
