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
set list listchars=tab:→\ ,trail:·

" Glorious technicolour!
set termguicolors
colorscheme base16-materia-meshy
syntax on
let g:SignatureMarkTextHLDynamic = 1
let g:rainbow_active = 1
let g:rainbow_conf = {'separately': {'htmldjango': 0}}

" Add rulers to highlight overly long lines
set colorcolumn=80,88,100

" Visual feedback on autocompleted commands
set wmnu

" Set up vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme="base16"


