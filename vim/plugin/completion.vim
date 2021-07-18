" Use deoplete for tab completion.
let g:deoplete#enable_at_startup = 1
" Enable icons in completions from LSP.
let g:deoplete#lsp#use_icons_for_candidates=v:true
" Make supertab play nice with deoplete's default ordering.
let g:SuperTabDefaultCompletionType = "<c-n>"
" Avoid Deoplete's annoying candidtate preview popup
autocmd FileType python setlocal completeopt-=preview
" Don't autocomplete in the telescope search box
autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)
