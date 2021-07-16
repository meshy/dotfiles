" Set up ALE (linting)
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'bash': ['shellcheck', 'bashate'],
\   'docker': ['hadolint'],
\   'javascript': ['eslint'],
\   'html': ['alex'],
\   'mail': ['alex'],
\   'markdown': ['alex'],
\   'python': ['isort'],
\   'yaml': ['yamllint'],
\}

let g:neoformat_enabled_rust = ['rustfmt']
let g:neoformat_enabled_python = ['isort', 'black']
let g:neoformat_enabled_sql = ['sqlfmt']
let g:neoformat_sql_sqlfmt = {
\   'exe': 'sqlfmt',
\   'args': ['--align full', '--use-spaces'],
\   'stdin': 1,
\}
let g:neoformat_enabled_html = ['html-beautify']
let g:neoformat_run_all_formatters = 1
let g:neoformat_enabled_terraform = ['terraform']
command F :Neoformat
