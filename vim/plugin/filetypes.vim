" Recognise files with unusual file extensions
au BufRead,BufNewFile *.md set filetype=markdown
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.html set filetype=htmldjango
au BufNewFile,BufRead *.sh.j2 set ft=sh
au BufNewFile,BufRead *.wsgi set ft=python
au BufNewFile,BufRead *.wsgi.j2 set ft=python
au BufNewFile,BufRead *.py.j2 set ft=python
au BufRead,BufNewFile *.tf set filetype=terraform
au BufNewFile,BufRead *.muttrc set ft=muttrc
au BufNewFile,BufRead Jenkinsfile set ft=groovy
au BufNewFile,BufRead .coveragerc set ft=dosini
