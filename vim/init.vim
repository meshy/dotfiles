set encoding=utf-8

" Load package manager
filetype plugin indent on
call plug#begin('~/.vim/plugged')
Plug '13k/vim-nginx'
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/whitespaste.vim'
Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'fisadev/vim-isort'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-startify'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimjas/vim-python-pep8-indent'
Plug 'w0rp/ale'
call plug#end()

" Get rid of that daft cow
let g:startify_custom_header = [
\ '   ┌────────┐',
\ '   │ NeoVim │',
\ '   ╘════════╛']

" Display errors nicely (and silently)
set noerrorbells
set novisualbell
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" Display search results nicely
hi Search ctermbg=red ctermfg=white

" Add line numbers
set relativenumber
set number

" Complain about trailing whitespace
set list
set list listchars=tab:→\ ,trail:·

" Indentation with four spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Glorious technicolour!
set termguicolors
colorscheme base16-materia-meshy
syntax on
let g:SignatureMarkTextHLDynamic = 1

" Highlight cursor position
set cursorline
set cursorcolumn

" Add rulers to highlight overly long lines
set colorcolumn=80,100

" Visual feedback on autocompleted commands
set wmnu

" Disable mouse and arrow keys, because sanity is for the weak.
set mouse=
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Recognise files with unusual file extensions
au BufRead,BufNewFile *.md set filetype=markdown
au BufNewFile,BufRead *.ejs set filetype=html

" Set up vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme="base16"

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

" Line breaking (splitjoin)
let g:splitjoin_python_brackets_on_separate_lines = 1
let g:splitjoin_trailing_comma = 1

" Set up fuzzy search on CTRL-P (with fzf)
nnoremap <C-p> :FZF<CR>

" Ignore case if search pattern is all lowercase, case-sensitive otherwise.
set ignorecase
set smartcase

" Don't insert two spaces after a full stop when wrapping lines.  It's silly.
set nojoinspaces

" Use semi-colon for vim-commands. This saves pressing shift all the time.
nnoremap ; :

" Make moving between buffers simpler:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
