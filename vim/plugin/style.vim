" Indentation with four spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

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
set list listchars=tab:→\ ,trail:·,nbsp:⌴

" Glorious technicolour!
set termguicolors
set background=dark
colorscheme base16-materia-meshy
" colorscheme base16-mexico-light
syntax on
let g:SignatureMarkTextHLDynamic = 1
let g:rainbow_active = 1
let g:rainbow_conf = {'separately': {'htmldjango': 0}}

" Add rulers to highlight overly long lines
set colorcolumn=88,100

" Visual feedback on autocompleted commands
set wmnu
