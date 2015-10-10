set encoding=utf-8
runtime bundle/vim-pathogen/autoload/pathogen.vim

" Load pathogen package manager
execute pathogen#infect()
filetype plugin indent on

" Display errors nicely (and silently)
set noerrorbells
set novisualbell
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" Display search results nicely
hi Search ctermbg=DarkGrey

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
let g:airline_theme='powerlineish'

" Search ctags with CtrlP
nnoremap <leader>. :CtrlPTag<cr>
" Use `ag` to make CtrlP indexing faster
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
