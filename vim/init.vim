set encoding=utf-8

" Load package manager
filetype plugin indent on
call plug#begin('~/.vim/plugged')
Plug '13k/vim-nginx'
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'chriskempson/base16-vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kalekundert/vim-coiled-snake'
Plug 'kshenoy/vim-signature'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'rking/ag.vim'
Plug 'sbdchd/neoformat'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
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

" Set up ALE (linting)
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'bash': ['shellcheck'],
\   'javascript': ['eslint'],
\   'html': ['alex'],
\   'mail': ['alex'],
\   'markdown': ['alex'],
\   'python': ['flake8', 'isort'],
\   'yaml': ['yamllint'],
\}
" CTRL-j and -k for next and prev lint error.
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"  Black (python formatting)
let g:neoformat_python_black = {
            \ 'exe': 'black',
            \ 'stdin': 1,
            \ 'args': ['--skip-string-normalization', '-q', '-'],
            \ }

let g:neoformat_enabled_python = ['isort', 'black']
let g:neoformat_enabled_sql = ['sqlfmt']
let g:neoformat_enabled_html = ['html-beautify']
let g:neoformat_run_all_formatters = 1
command F :Neoformat

" Use semi-colon for vim-commands. This saves pressing shift all the time.
nnoremap ; :

" Security. https://securitytracker.com/id/1009014
set modelines=0
