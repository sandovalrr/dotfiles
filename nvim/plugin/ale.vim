let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\   'typescript': ['tslint','prettier'],
\   'html': ['prettier'],
\   'go': ['gofmt'],
\   'yaml': ['prettier'],
\   'json': ['prettier'],
\   'graphql': ['gqlint']
\}

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'tslint'],
\   'html': ['prettier'],
\   'go': ['gofmt'],
\   'yaml': ['prettier'],
\   'json': ['prettier'],
\   'graphql': ['prettier']
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
