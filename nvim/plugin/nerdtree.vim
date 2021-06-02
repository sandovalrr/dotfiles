let g:NERDTreeHijackNetrw=0
augroup NERDTreeHijackNetrw
  autocmd VimEnter * silent! autocmd! FileExplorer
augroup END

let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

function RNERDToggle()
  try
    if &filetype == 'nerdtree'
        :NERDTreeToggle
    elseif &filetype == ''
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
  catch /.*/
    :NERDTreeToggle
  endtry
endfunction

nnoremap <C-g> :call RNERDToggle()<CR>
autocmd BufEnter * lcd %:p:h


"" NERDTree configuration
let g:NERDTreeChDirMode=0
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', '^node_modules$']
"", '^node_modules$']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:NERDTreeGitStatusWithFlags = 1
let g:webdevicons_enable_nerdtree = 1
let g:NERDTreeHighlightCursorline = 0
