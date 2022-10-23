let g:ale_linters = {
\   '*': ['prettier'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver'],
\   'typescriptreact': ['eslint', 'tsserver'],
\   'html': ['prettier'],
\   'go': ['gofmt'],
\   'yaml': ['prettier'],
\   'json': ['prettier'],
\   'graphql': ['gqlint'],
\   'sh' : ['shell'],
\   'scss': ['prettier'],
\   'css': ['prettier']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\   'html': ['prettier'],
\   'go': ['gofmt'],
\   'yaml': ['prettier'],
\   'json': ['prettier'],
\   'scss': ['prettier'],
\   'css': ['prettier'],
\   'graphql': ['prettier'],
\   'sh': ['shfmt'],
\   'svg': ['prettier']
\}

" let g:ale_fix_on_save= 1
" let g:ale_completion_enabled = 1

nmap <leader>f <Plug>(ale_fix)

" Use a slightly slimmer error pointer
let g:ale_sign_error = '✖'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚠'
hi ALEWarningSign guifg=#F2C38F

" Use ALT-k and ALT-j to navigate errors
nmap <silent> ˚ <Plug>(ale_previous_wrap)
nmap <silent> ∆ <Plug>(ale_next_wrap)
let g:ale_completion_autoimport = 1
