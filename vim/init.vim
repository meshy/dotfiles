set encoding=utf-8

" Load package manager
filetype plugin indent on
call plug#begin('~/.vim/plugged')
Plug '13k/vim-nginx'
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'hashivim/vim-terraform'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kalekundert/vim-coiled-snake'
Plug 'kshenoy/vim-signature'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'udalov/kotlin-vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'rking/ag.vim'
Plug 'ruanyl/vim-gh-line'  " Adds <leader>gh to open current line in github
Plug 'sbdchd/neoformat'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimjas/vim-python-pep8-indent'
Plug 'w0rp/ale'
call plug#end()

" Use semi-colon for vim-commands. This saves pressing shift all the time.
nnoremap ; :

" Security. https://securitytracker.com/id/1009014
set modelines=0
