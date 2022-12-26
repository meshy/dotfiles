vim.cmd([[
" Load package manager
call plug#begin('~/.vim/plugged')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'chriskempson/base16-vim'
Plug 'deoplete-plugins/deoplete-lsp'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'hashivim/vim-terraform'
Plug 'ibhagwan/fzf-lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'kalekundert/vim-coiled-snake'  " see https://github.com/kalekundert/vim-coiled-snake/issues/34
Plug 'Konfekt/FastFold'  " Stops folding re-calculations from slowing things down. Especially Neoformat.
Plug 'kshenoy/vim-signature'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'luochen1990/rainbow'
Plug 'mhinz/vim-startify'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'udalov/kotlin-vim'
Plug 'raimon49/requirements.txt.vim'
Plug 'ruanyl/vim-gh-line'  " Adds <leader>gh to open current line in github
Plug 'sbdchd/neoformat'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'simrat39/symbols-outline.nvim'  " Indentation issue: https://github.com/simrat39/symbols-outline.nvim/issues/126
" Memory usage is just too much.
" Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'tpope/vim-fugitive'  " Git integration
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'  " GitHub integration for vim-fugitive
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'  " Navigation with [
Plug 'tpope/vim-vinegar'  " File navigation with -
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'  " Linting
" Semantic Highlighting for Python
" This is a fork of the main semshi, because the original appears to be unmaintained. See:
" https://github.com/numirias/semshi/issues/126 and
" https://github.com/wookayin/semshi/issues/1
Plug 'wookayin/semshi', { 'do': ':UpdateRemotePlugins' }
call plug#end()
]])

-- Use semi-colon for vim-commands. This saves pressing shift all the time.
vim.keymap.set( 'n',   ';', ':', {noremap = true})
