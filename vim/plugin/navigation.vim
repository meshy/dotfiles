" Line breaking (splitjoin)
let g:splitjoin_python_brackets_on_separate_lines = 1
let g:splitjoin_trailing_comma = 1

" Set up fuzzy search on CTRL-P (with fzf)
nnoremap <C-p> :FzfLua files<CR>

" Add a shortcut for tagbar (now symbols-outline)
nmap <F8> :SymbolsOutline<CR>
