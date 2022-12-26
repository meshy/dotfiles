local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  'AndrewRadev/splitjoin.vim',
  'chriskempson/base16-vim',
  'deoplete-plugins/deoplete-lsp',
  'editorconfig/editorconfig-vim',
  'ervandew/supertab',
  'Glench/Vim-Jinja2-Syntax',
  'hashivim/vim-terraform',
  {
    'ibhagwan/fzf-lua',
    dependencies = {'nvim-tree/nvim-web-devicons'}
  },
  'Konfekt/FastFold',  -- Stops folding re-calculations from slowing things down. Especially Neoformat.
  'kshenoy/vim-signature',
  'nvim-tree/nvim-web-devicons',  -- Pretty icons for the fuzzy finder.
  {
    'lewis6991/gitsigns.nvim',
    config = {
      signs = {
        add          = {hl = 'GitSignsAdd'   , text = '✚', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '↻', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '▁', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '▔', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '—↻', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      },
    },
  },
  'luochen1990/rainbow',
  'mhinz/vim-startify',
  {
    'norcalli/nvim-colorizer.lua',
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
    build = ':TSUpdate',
  },
  'neovim/nvim-lspconfig',
  {
    'udalov/kotlin-vim',
    ft = 'kotlin',
  },
  'raimon49/requirements.txt.vim',
  'ruanyl/vim-gh-line',  -- Adds <leader>gh to open current line in github
  'sbdchd/neoformat',
  {
    'Shougo/deoplete.nvim',
    build=':UpdateRemotePlugins',
  },
  'simrat39/symbols-outline.nvim',  -- Indentation issue: https://github.com/simrat39/symbols-outline.nvim/issues/126
  'tpope/vim-fugitive',  -- Git integration
  'tpope/vim-git',
  'tpope/vim-repeat',
  'tpope/vim-rhubarb',  -- GitHub integration for vim-fugitive
  'tpope/vim-surround',
  'tpope/vim-unimpaired',  -- Navigation with [
  'tpope/vim-vinegar',  -- File navigation with -
  'vim-airline/vim-airline',
  'vim-airline/vim-airline-themes',
  'w0rp/ale',  -- Linting
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
vim.keymap.set( 'n',   ';', ':', {noremap = true})
