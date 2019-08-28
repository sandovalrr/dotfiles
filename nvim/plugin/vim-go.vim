" Enable Dispatch for GoRun and GoBuild -> I made this!
let g:go_dispatch_enabled = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

let g:go_build_tags = "smoke integration"

let g:syntastic_go_go_test_args = '-tags="smoke integration"'
let g:syntastic_go_go_build_args = '-tags="smoke integration"'

let root_import_path = system("ABS=$(git rev-parse --show-toplevel); echo \${ABS#$GOPATH/src/}")
let g:go_guru_scope = [root_import_path]

let g:go_fmt_autosave = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_go_checkers = ['gofmt', 'go', 'errcheck', 'golint', 'govet' ]
let g:go_list_type = "quickfix"
