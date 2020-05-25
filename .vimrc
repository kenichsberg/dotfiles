scriptencoding utf-8
"メニューバーを読み込まない
set guioptions& guioptions+=M

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"path for winPC// set rtp+=$VIM\.vim\bundle\Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" !! write plugins here !!
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'preservim/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'
Plugin 'vim-scripts/YankRing.vim'
"Plugin 'vim-scripts/Changed'
Plugin 'alvan/vim-closetag'
"Plugin 'tyru/open-browser.vim'
Plugin 'dense-analysis/ale'
Plugin 'luochen1990/rainbow'
Plugin 'ryanoasis/vim-devicons'
Plugin 'gabrielelana/vim-markdown'
Plugin 'previm/previm'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"-----------------------------------------------------------------------
"テーマ設定
set background=dark
colorscheme PaperColor
"-----------------------------------------------------------------------
"各プラグイン用の設定
"
"----------------------------
"NERDTree
"nnoremap <silent><C-e> :NERDTreeToggle<CR>
" 隠しファイルを表示する
let NERDTreeShowHidden = 1
" デフォルトでツリーを表示させる
let g:nerdtree_tabs_open_on_console_startup=1
" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <Space>e :NERDTreeToggle<CR>
nnoremap <Space>f :NERDTreeFind<CR>

"----------------------------
"closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php,*.ctp,*.js'

"----------------------------
"airline
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme = 'luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"----------------------------
"indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#24323b   ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#243b3b   ctermbg=237
let g:indent_guides_guide_size = 1

"----------------------------
"ale
let g:airline#extensions#ale#enabled = 1
"let g:ale_statusline_format = ['E%d', 'W%d', '']
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"eslint_dを利用するための設定
if executable('eslint_d')
  let g:ale_javascript_eslint_use_global = 1
  let g:ale_javascript_eslint_executable = 'eslint_d'
endif

let g:ale_linters_explicit = 1
let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'typescript': ['tsserver', 'eslint'],
  \   'vue': ['eslint']
  \ }

"----------------------------
"rainbow
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

"----------------------------
"vim-devicons
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
"" フォルダアイコンを表示
"let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
"let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
"" after a re-source, fix syntax matching issues (concealing brackets):
"if exists('g:loaded_webdevicons')
"  call webdevicons#refresh()
"endif


"-----------------------------------------------------------------------
" setting
"文字コードをUFT-8に設定
set fenc=utf-8
set encoding=utf-8
set fileformats=unix,dos,mac
"set clipboard+=unnamed "yankとクリップボードを使い分けできたほうが便利なためmacOS以外では不要 

"set nobackup
"set noswapfile

" swpファイル出力先
set directory=~/.vim/tmp/swap
" バックアップファイル出力先
set backupdir=~/.vim/tmp/backup
" undoファイル出力先
set undodir=~/.vim/tmp/undo
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

"" autofmt: 日本語文章のフォーマット(折り返し)プラグイン.
"set formatexpr=autofmt#japanese#formatexpr()

"-----------------------------------------------------------------------
" 見た目系
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

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
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

"---------------------------------------------------------------------------
" タブ&インデント
" 不可視文字を可視化(タブが「@-」と表示される)
set list listchars=tab:\@\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

"---------------------------------------------------------------------------
" 検索系
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

"---------------------------------------------------------------------------
"キーマップ
"escキーをjjに割り当てる
inoremap <silent> jj <ESC>

"ミス多発のため小文字化は殺す
vnoremap u <Nop>

vnoremap ZQ <Nop>
vnoremap ZZ <Nop>

"---------------------------------------------------------------------------
"分割表示・タブ表示関連
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
"nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
"nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

"call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
"call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
"call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
"call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
"call submode#map('bufmove', 'n', '', '>', '<C-w>>')
"call submode#map('bufmove', 'n', '', '<', '<C-w><')
"call submode#map('bufmove', 'n', '', '+', '<C-w>+')
"call submode#map('bufmove', 'n', '', '-', '<C-w>-')

