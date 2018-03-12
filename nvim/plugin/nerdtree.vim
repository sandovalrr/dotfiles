let g:NERDTreeHijackNetrw=0
augroup NERDTreeHijackNetrw
  autocmd VimEnter * silent! autocmd! FileExplorer 
augroup END

let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
:nnoremap <C-g> :NERDTreeToggle<CR>
autocmd BufEnter * lcd %:p:h 

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
let NERDTreeShowHidden=1


