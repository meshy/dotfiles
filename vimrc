set encoding=utf-8

" Remove visual bell stuff
set noerrorbells
set novisualbell

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

" Disable arrow keys, because sanity is for the weak.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Recognise markdown files with the extension '.md'
au BufRead,BufNewFile *.md set filetype=markdown
