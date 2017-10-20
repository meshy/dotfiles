set encoding=utf-8

" Load package manager
filetype plugin indent on
call plug#begin('~/.vim/plugged')
Plug 'spf13/vim-autoclose'
Plug 'airblade/vim-gitgutter'
Plug 'alfredodeza/khuno.vim'
Plug 'bling/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'fisadev/vim-isort'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kshenoy/vim-signature'
Plug 'luochen1990/rainbow'
Plug 'mhinz/vim-startify'
Plug 'pearofducks/ansible-vim'
Plug 'rainux/vim-vala'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wavded/vim-stylus'
Plug 'wookiehangover/jshint.vim'
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
syntax on
set background=dark
set cursorline
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'ctermfgs': ['blue', 'green', 'yellow', 'cyan', 'magenta'],
    \   'separately': {
    \       '*': {},
    \       'htmldjango': {
    \           'parentheses': [
    \               'start="{{" end="}}"',
    \               'start="{%" end="%}"',
    \               'start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end="</\z1>" fold'
    \           ],
    \       }
    \   }
    \}
let g:SignatureMarkTextHLDynamic = 1

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

" Set up fuzzy search on CTRL-P (with fzf)
nmap <C-p> :FZF<CR>

" Don't insert two spaces after a full stop when wrapping lines.  It's silly.
set nojoinspaces
