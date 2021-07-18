" Line breaking (splitjoin)
let g:splitjoin_python_brackets_on_separate_lines = 1
let g:splitjoin_trailing_comma = 1

" Set up fuzzy search on CTRL-p (with telescope)
nnoremap <C-p> :Telescope find_files<CR>

" Add a shortcut for tagbar.
nmap <F8> :TagbarToggle<CR>
