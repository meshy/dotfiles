" Use deoplete for tab completion.
let g:deoplete#enable_at_startup = 1
" Leave jedi completion to deoplete.
let g:jedi#completions_enabled = 0
" Make supertab play nice with deoplete's default ordering.
let g:SuperTabDefaultCompletionType = "<c-n>"
" Avoid jedi's annoying popup at the top of the screen.
autocmd FileType python setlocal completeopt-=preview
