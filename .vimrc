scriptencoding utf-8
"メニューバーを読み込まない
"set guioptions& guioptions+=M

set nocompatible              " be iMproved, required
filetype on                   " required

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'NLKNguyen/papercolor-theme'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
"Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'styled-components/vim-styled-components'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'vim-scripts/YankRing.vim'
"Plug 'alvan/vim-closetag'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier'
"Plug 'luochen1990/rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'gabrielelana/vim-markdown'
Plug 'previm/previm'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'will133/vim-dirdiff'
Plug 'tpope/vim-obsession'

call plug#end()

"-----------------------------------------------------------------------
" Theme
"-----------------------------------------------------------------------
set background=dark
colorscheme PaperColor

"-----------------------------------------------------------------------
" Config for each plugin
"-----------------------------------------------------------------------
"----------------------------
" #NERDTree
"----------------------------
" 隠しファイルを表示する
let NERDTreeShowHidden = 1
" デフォルトでツリーを表示させる
let g:nerdtree_tabs_open_on_console_startup=1
" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <Space>e :NERDTreeToggle<CR>
nnoremap <Space>f :NERDTreeFind<CR>

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
let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver', 'coc-json']

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

" swap & backup files
"set nobackup
"set noswapfile

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
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
"" 現在の行を強調表示（縦）
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax enable
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を非表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title

"----------------------------
" Tabs & indent
"----------------------------
" 不可視文字を可視化(タブが「@-」と表示される)
set list listchars=tab:\@\-
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" c program file
set cindent
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" keyboard
set softtabstop=2
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

filetype plugin on
filetype indent on
autocmd FileType php setlocal sw=4 sts=4 ts=4 et

"----------------------------
" Search
"----------------------------
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan  
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"vimgrep -> 自動的にquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow

"----------------------------
" Key mapping
"----------------------------
" asign esc key to 'jj'
inoremap <silent> jj <ESC>

" toggle paste mode
"nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
"set showmode

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
" Control panes of windows
"----------------------------
nnoremap s <Nop>
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
"nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>


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
