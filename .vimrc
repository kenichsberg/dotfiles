scriptencoding utf-8

set nocompatible              " be iMproved, required
filetype on                   " required

call plug#begin('~/.vim/plugged')

" for preferences
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'

" handling folders and files
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ctrlpvim/ctrlp.vim'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" tmux
Plug 'tpope/vim-obsession'

" for input
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'will133/vim-dirdiff'

Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'

" js/ts
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', {'for': ['javascript', 'typescript', 'javascriptreact', 'typescriptreact']}
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascriptreact']}
Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'typescriptreact']}
Plug 'maxmellon/vim-jsx-pretty', {'for': ['javascript', 'typescript', 'javascriptreact', 'typescriptreact']}
Plug 'jparise/vim-graphql'
Plug 'styled-components/vim-styled-components'

" md
Plug 'gabrielelana/vim-markdown', {'for': 'markdown'}
Plug 'previm/previm'

" clojure
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}

call plug#end()


"-----------------------------------------------------------------------
" Theme
"-----------------------------------------------------------------------
set background=dark
colorscheme PaperColor


"-----------------------------------------------------------------------
" settings
"-----------------------------------------------------------------------
"----------------------------
" Handling files
"----------------------------
" encode
set fenc=utf-8
set encoding=utf-8
set fileformats=unix,dos,mac

".viminfo file path
set viminfo=%,<800,'10,/50,:100,h,f0,n~/.vim/temp/.viminfo
" swp file directory
set directory=~/.vim/tmp/swap
" backup file directory
set backupdir=~/.vim/tmp/backup
" undo file directory
set undodir=~/.vim/tmp/undo
" automatically refresh file when edited externally
set autoread
" allow to open files even when buffers are editing
set hidden
" display command input in status line
set showcmd

"----------------------------
" Preferences
"----------------------------
" show row number
set number
" show current row
set cursorline
" move cursor onemore the end of row
set virtualedit=onemore
" visualize beep sound
set visualbell
" show matching parenthesis
set showmatch
" show status line
set laststatus=2
" autocompletion for command line
set wildmode=list:longest
" move cusor for rows shown
nnoremap j gj
nnoremap k gk
" syntax highlighting
syntax enable
" show rouler
set ruler
" タブや改行を非表示 (list:表示)
set nolist
" show long rows with wrapping
set wrap
" height of command line 
set cmdheight=2
" show command in status line
set showcmd
" show title
set title

"----------------------------
" Tabs & indent
"----------------------------
" show tab by '>-'
"set listchars=tab:>-,extends:<,trail:-,eol:<
set list listchars=tab:>-
" indent automatically
set autoindent
set smartindent
" for c program file
set cindent
" use tab key for adding space of the amount of 'shiftwidth'
set smarttab
" replace tab to space
set expandtab
" except for the start of row, tab will be the following amount of space 
set tabstop=2
" at the start of row, tab will be the following amount of space 
set shiftwidth=2
" keyboard
set softtabstop=2
" enable deleting by backspace
set backspace=indent,eol,start
" cf. :help wildmenu
set wildmenu
" for Japanese language
set formatoptions+=mM

filetype plugin on
filetype indent on
autocmd FileType php setlocal sw=4 sts=4 ts=4 et

"----------------------------
" Search
"----------------------------
" ignore case when keyword is in lowercase
set ignorecase
" distinguish case when keyword includes uppercase
set smartcase

set incsearch
" loop searching words from bottom of the file to the top
set wrapscan
" highlighting the keyword
set hlsearch
" remove highlighted by hitting enter key
nnoremap <silent> <CR> :nohlsearch<CR><CR>

"on vimgrep -> open quickfix-window automatically
autocmd QuickFixCmdPost *grep* cwindow

"----------------------------
" Other Settings
"----------------------------
" register yanked string to clipboard
"set clipboard=unnamedplus

"----------------------------
" Key mapping
"----------------------------
" leader
let mapleader="\<Space>"
nnoremap <Space> <Nop>

" swap colon with semicolon
noremap ; :
noremap : ;

" asign esc key to 'jj'
inoremap <silent> jj <ESC>

" toggle paste mode
set pastetoggle=<F2>

" reload syntax highlighting
noremap <F5> <Esc>:syntax sync fromstart<CR>
inoremap <F5> <C-o>:syntax sync fromstart<CR>

" kill function converting lowercase to prevent accidental typing
" *not to mix it up with undo in normal mode
vnoremap u <Nop>

" kill some shortcuts to prevent accidental typing
vnoremap ZQ <Nop>
vnoremap ZZ <Nop>

"----------------------------
" Controling panes on a window
"----------------------------
nnoremap s <Nop>
nmap s <Nop>
xmap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

" resizing panes
" resize height
nnoremap sdj <C-w>-
nnoremap sdk <C-w>+
" resize width
nnoremap sdh <C-w><
nnoremap sdl <C-w>>


"-----------------------------------------------------------------------
" Config for plugins
"-----------------------------------------------------------------------
"----------------------------
" #NERDTree
"----------------------------
" show hidden files
let NERDTreeShowHidden = 1
" hide tree by default
let g:nerdtree_tabs_open_on_console_startup=0
" close buffer if only nerdtree is remained
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" toggle tree
nnoremap <leader>ff :NERDTreeToggle<CR>
" find the file where cursor is in tree
nnoremap <leader>fd :NERDTreeFind<CR>

"----------------------------
" #airline
"----------------------------
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme = 'luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"----------------------------
" #indent-guides
"----------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#24323b   ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#243b3b   ctermbg=237
let g:indent_guides_guide_size = 1

"----------------------------
" #vim-yankstack
"----------------------------
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

"----------------------------
" #ale
"----------------------------
let g:airline#extensions#ale#enabled = 1
"let g:ale_statusline_format = ['E%d', 'W%d', '']
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"enable eslint_d
if executable('eslint_d')
  let g:ale_javascript_eslint_executable = 'eslint_d'
  let g:ale_javascript_eslint_use_global = 1
endif
let g:ale_json_jsonlint_use_global = 1
let g:ale_json_jsonlint_executable = '/Users/tsc/.nvm/versions/node/v14.13.1/bin/jsonlint'

let g:ale_linters_explicit = 1
let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'javascriptreact': ['eslint'],
  \   'typescript': ['tsserver', 'eslint'],
  \   'typescriptreact': ['tsserver', 'eslint'],
  \   'json': ['jsonlint'],
  \   'clojure': ['clj-kondo', 'joker'],
  \ }
"config for auto formatting
let g:ale_fixers = {
  \   'javascript': ['prettier'],
  \   'javascriptreact': ['prettier'],
  \   'typescript': ['prettier'],
  \   'typescriptreact': ['prettier'],
  \   'css': ['prettier'],
  \   'markdown': [
  \     {buffer, lines -> {'command': 'textlint -c ~/.config/textlintrc -o /dev/null --fix --no-color --quiet %t', 'read_temporary_file': 1}}
  \   ],
  \ }
let g:ale_fix_on_save = 1

"use local config
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_typescript_prettier_use_local_config = 1


"----------------------------
" #CoC
"----------------------------
" CoC extensions
let g:coc_global_extensions = [
  \ 'coc-solargraph',
  \ 'coc-tsserver', 
  \ 'coc-json',
  \ 'coc-diagnostic',
  \ ]

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


"----------------------------
" #vim-iced
"----------------------------
" enable default key mapping
let g:iced_enable_default_key_mappings = v:true

aug VimIcedAutoFormatOnWriting
  au!
  " Format whole buffer on writing files
  au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSyncAll'

  " Format only current form on writing files
  " au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSync'
aug END


"----------------------------
" OTHER SETTINGS
"----------------------------
" get rid of [  ] around icons in NerdTree
"----------------------------
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

"----------------------------
" unable 'cursorline'
"----------------------------
augroup vimrc-auto-cursorline
autocmd!
autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
autocmd WinEnter * call s:auto_cursorline('WinEnter')
autocmd WinLeave * call s:auto_cursorline('WinLeave')

let s:cursorline_lock = 0
function! s:auto_cursorline(event)
  if a:event ==# 'WinEnter'
    setlocal cursorline
    let s:cursorline_lock = 2
  elseif a:event ==# 'WinLeave'
    setlocal nocursorline
  elseif a:event ==# 'CursorMoved'
    if s:cursorline_lock
      if 1 < s:cursorline_lock
        let s:cursorline_lock = 1
      else
        setlocal nocursorline
        let s:cursorline_lock = 0
      endif
    endif
  elseif a:event ==# 'CursorHold'
    setlocal cursorline
    let s:cursorline_lock = 1
  endif
endfunction
augroup END
