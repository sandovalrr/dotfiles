inoremap <silent><expr> <C-X><C-O> coc#refresh()
inoremap <silent><expr> <Enter> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"