" Folding
" Open files with all folds open.
set foldlevel=99

" Toggle folding with space.
nnoremap <space> za

"Use treesitter for code folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
