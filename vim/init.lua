local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'AndrewRadev/splitjoin.vim',
    event = 'VeryLazy',
  },
  {
    'anuvyklack/windows.nvim',
    opts = {
      autowidth = {
        -- The `textwidth` setting being 0 gives us a default of 80,
        -- plus 8 to get 88 for Python, plus 7 for the sidebar.
        winwidth = 8 + 7,
      },
    },
    dependencies = {
      'anuvyklack/middleclass'
    },
    event = 'VeryLazy',
  },
  {
    'deoplete-plugins/deoplete-lsp',
    event = 'VeryLazy',
  },
  {
    'duane9/nvim-rg',
    event = 'VeryLazy',
  },
  {
    'editorconfig/editorconfig-vim',
    event = 'VeryLazy',
  },
  {
    'ervandew/supertab',
    event = 'VeryLazy',
  },
  {
    'github/copilot.vim',
    event = 'VeryLazy',
  },
  {
    'Glench/Vim-Jinja2-Syntax',
    event = 'VeryLazy',
  },
  {
    'hashivim/vim-terraform',
    ft='terraform',
  },
  {
    'ibhagwan/fzf-lua',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    event = 'VeryLazy',
  },
  {
    -- Stops folding re-calculations from slowing things down. Especially Neoformat.
    'Konfekt/FastFold',
    event = 'VeryLazy',
  },
  {
    'kshenoy/vim-signature',
    event = 'VeryLazy',
  },
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        theme = 'material',
      },
      sections = {
        lualine_x = {
          {
            require('lazy.status').updates,
            cond = require('lazy.status').has_updates,
            color = { fg = '#ff9e64' },
          },
          'filetype',
        },
      },
    },
  },
  {
    -- Pretty icons for the fuzzy finder.
    'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = { signs = {} },
  },
  {
    'mhinz/vim-startify',
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'VeryLazy',
    config = function()
      vim.opt.termguicolors = true
      require('colorizer').setup()
    end,
  },
  {
    -- Helper functions used by other plugins.
    'nvim-lua/plenary.nvim',
    lazy=true,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    build = ':TSUpdate',
  },
  {
    'udalov/kotlin-vim',
    ft = 'kotlin',
  },
  {
    -- Syntax highlighting for Python requirements files.
    -- We can't use lazy-loading on this because its autoload script would fail.
    'raimon49/requirements.txt.vim',
  },
  {
    'sbdchd/neoformat',
    event = 'VeryLazy',
  },
  {
    'Shougo/deoplete.nvim',
    event = 'VeryLazy',
    build=':UpdateRemotePlugins',
  },
  {
    -- Git integration
    'tpope/vim-fugitive',
    event = 'VeryLazy',
  },
  {
    'tpope/vim-git',
    event = 'VeryLazy',
  },
  {
    'tpope/vim-repeat',
    event = 'VeryLazy',
  },
  {
    -- GitHub integration for vim-fugitive
    'tpope/vim-rhubarb',
    event = 'VeryLazy',
  },
  {
    -- Surround words with parens using `ysiw`
    'tpope/vim-surround',
    event = 'VeryLazy',
  },
  {
    -- Navigation with [
    'tpope/vim-unimpaired',
    event = 'VeryLazy',
  },
  {
    -- File navigation with -
    'tpope/vim-vinegar',
    event = 'VeryLazy',
  },
  {
    -- Linting
    'w0rp/ale',
    event = 'VeryLazy',
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'williamboman/mason.nvim',
        opts = {
          ui = {
            icons = {
                package_installed = '✓',
                package_pending = '➜',
                package_uninstalled = '✗'
            }
          }
        },
      },
      {
        'williamboman/mason-lspconfig.nvim',
        config = true,
      },
    },
  },
  -- Semantic Highlighting for Python
  -- This is a fork of the main semshi, because the original appears to be unmaintained. See:
  -- https://github.com/numirias/semshi/issues/126 and
  -- https://github.com/wookayin/semshi/issues/1
  {
    'wookayin/semshi',
    build = ':UpdateRemotePlugins',
    ft = 'python',
  },
})

-- Use semi-colon for vim-commands. This saves pressing shift all the time.
vim.keymap.set( 'n', ';', ':', {noremap = true})
