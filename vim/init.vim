set encoding=utf-8

" Load package manager
filetype plugin indent on
call plug#begin('~/.vim/plugged')
Plug '13k/vim-nginx'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'fisadev/vim-isort'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-startify'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
call plug#end()

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
colorscheme base16-materia
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

" Set up ALE (linting)
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'bash': ['shellcheck'],
\   'javascript': ['eslint'],
\   'python': ['flake8', 'isort'],
\   'yaml': ['yamllint'],
\}

" Set up fuzzy search on CTRL-P (with fzf)
nnoremap <C-p> :FZF<CR>

" Don't insert two spaces after a full stop when wrapping lines.  It's silly.
set nojoinspaces
