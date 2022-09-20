" Folding
" Open files with all folds open.
set foldlevel=99

" Toggle folding with space.
nnoremap <space> za

" Stop info from vim-coiled-snake from going off-screen
" let g:coiled_snake_explicit_sign_width=2

"Use treesitter for code folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
