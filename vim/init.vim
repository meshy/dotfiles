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

" Indentation with four spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Recognise files with unusual file extensions
au BufRead,BufNewFile *.md set filetype=markdown
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.html set filetype=htmldjango
au BufNewFile,BufRead *.sh.j2 set ft=sh
au BufNewFile,BufRead *.wsgi set ft=python
au BufNewFile,BufRead *.wsgi.j2 set ft=python
au BufNewFile,BufRead *.py.j2 set ft=python
au BufNewFile,BufRead *.muttrc set ft=muttrc

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

" Line breaking (splitjoin)
let g:splitjoin_python_brackets_on_separate_lines = 1
let g:splitjoin_trailing_comma = 1

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

" Use deoplete for tab completion.
let g:deoplete#enable_at_startup = 1
" Leave jedi completion to deoplete.
let g:jedi#completions_enabled = 0
" Make supertab play nice with deoplete's default ordering.
let g:SuperTabDefaultCompletionType = "<c-n>"
" Avoid jedi's annoying popup at the top of the screen.
autocmd FileType python setlocal completeopt-=preview

" Set up fuzzy search on CTRL-P (with fzf)
nnoremap <C-p> :FZF<CR>

" Add a shortcut for tagbar.
nmap <F8> :TagbarToggle<CR>

" Ignore case if search pattern is all lowercase, case-sensitive otherwise.
set ignorecase
set smartcase

" Don't insert two spaces after a full stop when wrapping lines.  It's silly.
set nojoinspaces

" Use semi-colon for vim-commands. This saves pressing shift all the time.
nnoremap ; :

" Folding
" Open files with all folds open.
set foldlevel=99
" Toggle folding with space.
nnoremap <space> za

" Security. https://securitytracker.com/id/1009014
set modelines=0
