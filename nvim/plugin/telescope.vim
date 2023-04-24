function OpenFiles()
  try
    :Telescope git_files
  catch
    :Telescope find_files
  endtry
endfunction


" Find files using Telescope command-line sugar.
nnoremap <leader>ff :call OpenFiles()<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:sync_with_nvim_tree = 1
