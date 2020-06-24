" Set up ALE (linting)
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'bash': ['shellcheck'],
\   'javascript': ['eslint'],
\   'html': ['alex'],
\   'mail': ['alex'],
\   'markdown': ['alex'],
\   'python': ['flake8', 'isort', 'mypy'],
\   'yaml': ['yamllint'],
\}

"  Black (python formatting)
let g:neoformat_python_black = {
            \ 'exe': 'black',
            \ 'stdin': 1,
            \ 'args': ['--skip-string-normalization', '-q', '-'],
            \ }

let g:neoformat_enabled_python = ['isort', 'black']
let g:neoformat_enabled_sql = ['sqlfmt']
let g:neoformat_sql_sqlfmt = {
            \ 'exe': 'sqlfmt',
            \ 'args': ['--align full', '--use-spaces'],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_html = ['html-beautify']
let g:neoformat_run_all_formatters = 1
command F :Neoformat
