" Section: General Config
" ----------------------------
filetype plugin on
set omnifunc=syntaxcomplete#Complete
let mapleader = ","
let &runtimepath .= "," . $DOTFILES . "/nvim"  " Add DOTFILES to runtimepath
let &packpath .= "," . $DOTFILES . "/nvim"

set encoding=UTF-8
set shell=zsh     " Set bash as the prompt for Vim
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set noshowmode
set timeoutlen=1000
set ttimeoutlen=0
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set scrolloff=3
set list listchars=tab:»·,trail:·  " Display extra whitespace characters
set hidden
set inccommand=nosplit
set clipboard=unnamedplus



" Line numbers
set number
set numberwidth=5

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Highlight search matches
set hlsearch

" Make it obvious where 120 characters is
" Lifted from StackOverflow user Jeremy W. Sherman
" http://stackoverflow.com/a/3765575/2250435
if exists('+colorcolumn')
  set textwidth=120
  set colorcolumn=+1
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)
endif "
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
"
" Point to the Python executables in `asdf`
let g:python_host_prog  = '/usr/bin/python3 '
let g:python3_host_prog = '/usr/bin/python3'

"
" Configure grep to use The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
endif
"
"
" Section: Autocommands
" --------------------------
if has("autocmd")
  filetype plugin indent on

  autocmd BufReadPost * "
    " When editing a file, always jump to the last known cursor position.
    " Don't do it for commit messages, when the position is invalid, or when
    " inside an event handler (happens when dropping a file on gvim).
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Automatically clean trailing whitespace
  let blacklist = ['ts', 'js', 'tsx', 'jsx']
  autocmd BufWritePre * if index(blacklist, &ft) < 0 | :%s/\s\+$//e

  autocmd BufRead,BufNewFile COMMIT_EDITMSG call pencil#init({'wrap': 'soft'})
                                        \ | set textwidth=0

  autocmd BufRead,BufNewFile *.md set filetype=markdown

  autocmd BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc,.babelrc set ft=json

  autocmd BufRead,BufNewFile gitconfig set ft=.gitconfig

	" autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
  " au BufNewFile,BufRead *.ts set filetype=typescript

endif
"
" Section: External Functions

" Open current file in Marked
function! MarkedPreview()
  :w
  exec ':silent !open -a "Marked 2.app" ' . shellescape('%:p')
  redraw!
endfunction
nnoremap <leader>md :call MarkedPreview()<CR>
"
" Open current repo in Tower
function! OpenInGitTower()
  call system('gittower ' . getcwd())
endfunction
nnoremap <leader>gt :call OpenInGitTower()<CR>
"
"
" Section: Load vim-plug plugins

" Specify plugins
call plug#begin()

" UI
" Plug 'sandovalrr/ayu-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'mhartington/oceanic-next'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline'            " Handy info
Plug 'vim-airline/vim-airline-themes'
Plug 'retorillo/airline-tablemode.vim'
Plug 'edkolev/tmuxline.vim'               " Make the Tmux bar match Vim
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'chrisbra/Colorizer'
Plug 'luochen1990/rainbow'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'

" Project Navigation
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf',                      { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-grepper'
Plug 'vim-scripts/ctags.vim'              " ctags related stuff
Plug 'majutsushi/tagbar'
Plug 'rbgrouleff/bclose.vim'              " Required by ranger.vim
Plug 'francoiscabrol/ranger.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" File Navigation
Plug 'vim-scripts/matchit.zip'            " More powerful % matching
Plug 'Lokaltog/vim-easymotion'            " Move like the wind!
Plug 'jeffkreeftmeijer/vim-numbertoggle'  " Smarter line numbers
Plug 'kshenoy/vim-signature'              " Show marks in the gutter
Plug 'haya14busa/incsearch.vim'           " Better search highlighting

"
" Editing
Plug 'tpope/vim-surround'                 " Change word surroundings
Plug 'tpope/vim-commentary'               " Comments stuff
Plug 'tpope/vim-repeat'
Plug 'dhruvasagar/vim-table-mode',        { 'on': 'TableModeEnable' }
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'jasonlong/vim-textobj-css'
Plug 'Konfekt/FastFold'
Plug 'editorconfig/editorconfig-vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'alvan/vim-closetag'
Plug 'lifepillar/pgsql.vim'
Plug 'chrisbra/Colorizer'
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Git
Plug 'tpope/vim-fugitive'                 " Git stuff in Vim
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim',                   { 'on': 'GV' }
Plug 'jez/vim-github-hub'

" Task Running
Plug 'tpope/vim-dispatch'                 " Run tasks asychronously in Tmux
Plug 'w0rp/ale'                           " Linter
Plug 'wincent/terminus'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Olical/vim-enmasse'                 " Edit all files in a Quickfix list
Plug 'janko-m/vim-test'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}


" Autocomplete
Plug 'Quramy/tsuquyomi'

" Language Support
" JavaScript
" Plug 'pangloss/vim-javascript'
Plug 'rhysd/npm-debug-log.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" TypeScript
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" Plug 'heavenshell/vim-tslint'
" Plug 'mhartington/nvim-typescript',       { 'do': ':UpdateRemotePlugins' }

" Elm
Plug 'ElmCast/elm-vim'

" HTML
Plug 'othree/html5.vim',                  { 'for': 'html' }
Plug 'mustache/vim-mustache-handlebars'
Plug 'mattn/emmet-vim'

" CSS
Plug 'hail2u/vim-css3-syntax',            { 'for': 'css' }

" Sass
Plug 'cakebaker/scss-syntax.vim'

" Ruby
Plug 'vim-ruby/vim-ruby',                 { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
:
" Python
Plug 'klen/python-mode',                  { 'for': 'python' }
Plug 'davidhalter/jedi-vim',              { 'for': 'python' }
Plug 'alfredodeza/pytest.vim',            { 'for': 'python' }

" Rust
Plug 'wellbredgrapefruit/tomdoc.vim',     { 'for': 'ruby' }
Plug 'wting/rust.vim'
Plug 'cespare/vim-toml'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nsf/gocode',                        { 'rtp': 'nvim', 'do': './nvim/symlink.sh' }
Plug 'zchee/deoplete-go'

" Markdown
Plug 'reedes/vim-pencil'                  " Markdown, Writing
Plug 'godlygeek/tabular',                 { 'for': 'markdown' } " Needed for vim-markdown
Plug 'plasticboy/vim-markdown',           { 'for': 'markdown' }

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

" SQL
Plug 'vim-scripts/dbext.vim'

" Graphql
Plug 'jparise/vim-graphql'

call plug#end()
" Load plugin configurations
" For some reason, a few plugins seem to have config options that cannot be
" placed in the `plugins` directory. Those settings can be found here instead.

" vim-airline
let g:airline_powerline_fonts = 1 " Enable the patched Powerline fonts

" emmet-vim
let g:user_emmet_leader_key='<C-E>'

let g:user_emmet_settings = {
  \    'html' : {
  \        'quote_char': "'"
  \    }
  \}
"

" ranger.vim
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory

" Section: Remaps

" Normal Mode Remaps

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nnoremap <silent> + :exe "vertical resize +5"<CR>
nnoremap <silent> - :exe "vertical resize -5"<CR>
nnoremap <silent> <Space>+ :exe "resize +5"<CR>
nnoremap <silent> <Space>- :exe "resize -5"<CR>

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Smarter pasting
nnoremap <Leader>p :set invpaste paste?<CR>

" -- Smart indent when entering insert mode with i on empty lines --------------
function! IndentWithI()
  if len(getline('.')) == 0
    return "\"_ddO"
  else
    return "i"
  endif
endfunction
nnoremap <expr> i IndentWithI()

" Remap the increment and decrement features of Vim
nnoremap <A-a> <C-a>
nnoremap å <C-a>

nnoremap <A-x> <C-x>
nnoremap ≈ <C-x>

" Tab Shortcuts
nnoremap tk :tabfirst<CR>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tj :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :CtrlSpaceTabLabel<CR>
nnoremap td :tabclose<CR>

" nnoremap <silent> <c-j> :TmuxNavigateDown<cr>

"
" Insert Mode Remaps

set completeopt-=preview

"
"
" Section: Theme

set termguicolors
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
" set background=dark
" colorscheme nova
" Or if you have Neovim >= 0.1.5
" if (has("termguicolors"))
"   set termguicolors
" endif

" Theme
syntax on
" colorscheme OceanicNext
" let g:airline_theme = "mirage"
" colorscheme hybrid_reverse
" let ayucolor="dark"
" colorscheme ayu
colorscheme onedark

let g:enable_bold_font = 1
let g:enable_italic_font = 1
let g:hybrid_transparent_background = 1
let g:onedark_terminal_italics = 1

" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" hi! Normal ctermbg=NONE guibg=NONE

" let g:airline_theme='oceanicnext'

" colorscheme hybrid_material
" let g:enable_bold_font = 1
" let g:enable_italic_font = 1

" Setup Terminal Colors For Neovim
" if has('nvim')
"   " dark0 + gray
"   let g:terminal_color_0 = "#282828"
"   let g:terminal_color_8 = "#928374"

"   " neurtral_red + bright_red
"   let g:terminal_color_1 = "#cc241d"
"   let g:terminal_color_9 = "#fb4934"

"   " neutral_green + bright_green
"   let g:terminal_color_2 = "#98971a"
"   let g:terminal_color_10 = "#b8bb26"

"   " neutral_yellow + bright_yellow
"   let g:terminal_color_3 = "#d79921"
"   let g:terminal_color_11 = "#fabd2f"

"   " neutral_blue + bright_blue
"   let g:terminal_color_4 = "#458588"
"   let g:terminal_color_12 = "#83a598"

"   " neutral_purple + bright_purple
"   let g:terminal_color_5 = "#b16286"
"   let g:terminal_color_13 = "#d3869b"

"   " neutral_aqua + faded_aqua
"   let g:terminal_color_6 = "#689d6a"
"   let g:terminal_color_14 = "#8ec07c"

"   " light4 + light1
"   let g:terminal_color_7 = "#a89984"
"   let g:terminal_color_15 = "#ebdbb2"
" endif "
"
" Section: Local-Machine Config

if filereadable($DOTFILES . "/nvim/init.local.vim")
  source $DOTFILES/nvim/init.local.vim
endif
"
" Section: General Configs
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
autocmd BufEnter * set mouse=

autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
nnoremap <C-l> gt
nnoremap <C-h> gT
"
