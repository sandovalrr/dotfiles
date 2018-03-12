let g:NERDTreeHijackNetrw=0
augroup NERDTreeHijackNetrw
  autocmd VimEnter * silent! autocmd! FileExplorer 
augroup END

let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
:nnoremap <C-g> :NERDTreeToggle<CR>
autocmd BufEnter * lcd %:p:h 
