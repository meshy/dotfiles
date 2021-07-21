" Folding
" Open files with all folds open.
set foldlevel=99

" Toggle folding with space.
nnoremap <space> za

" Stop info from vim-coiled-snake from going off-screen
let g:coiled_snake_explicit_sign_width=2

"Allow folding in terraform files (uses vim-terraform)
"let g:terraform_fold_sections=1
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
