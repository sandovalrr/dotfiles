" let g:copilot_assume_mapped = true
" vim.g.copilot_no_tab_map = true
" vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

" imap <silent><script><expr> <C-e> copilot#Accept('\<CR>')
" let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <C-O> copilot#Accept("<End>")
let g:copilot_no_tab_map = v:true
let g:copilot_assume_mapped = v:true
" let g:copilot_assume_mapped = v:true
