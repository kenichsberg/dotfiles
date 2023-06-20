scriptencoding utf-8

set nocompatible              " be iMproved, required
filetype on                   " required


" Install vim-plug, if not installed yet.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" LSP support
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }

" for preferences
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'

" handling folders and files
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'jremmen/vim-ripgrep'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" tmux
Plug 'tpope/vim-obsession'

" for input
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
Plug 'clojure-vim/clojure.vim', {'for': 'clojure'}
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
" Plug 'liquidz/vim-iced', {'for': 'clojure'}
" Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}
" Plug 'lambdalisue/fern.vim'
" Plug 'liquidz/vim-iced-fern-debugger', {'for': 'clojure'}
Plug 'Olical/conjure'
Plug 'm00qek/baleia.nvim', {'tag': 'v1.3.0'}

" fennel
Plug 'atweiden/vim-fennel'

" others
Plug 'will133/vim-dirdiff'
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'hail2u/vim-css3-syntax', {'for': 'css'}


call plug#end()


"-----------------------------------------------------------------------
" Config for plugins
"-----------------------------------------------------------------------

" leader
let mapleader="\<Space>"
let maplocalleader="\<Space>"
nnoremap <Space> <Nop>

"----------------------------
" #Mason
"----------------------------
"lua <<EOF
"require('mason').setup()
"EOF

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
" #telescope
"----------------------------
nnoremap <leader><Space> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>sp      <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>*       <cmd>lua require('telescope.builtin').grep_string()<cr>
vnoremap <leader>sp      <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>ss      <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>bb      <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>?       <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>'       <cmd>lua require('telescope.builtin').resume()<cr>
nnoremap <leader>"       <cmd>lua require('telescope.builtin').search_history()<cr>
nnoremap <leader>:       <cmd>lua require('telescope.builtin').commands()<cr>
nnoremap <leader>;       <cmd>lua require('telescope.builtin').command_history()<cr>
nnoremap <leader>fh      <cmd>lua require('telescope.builtin').help_tags()<cr>

lua <<EOF
local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    },
  }
}
EOF
hi TelescopeMatching cterm=NONE ctermfg=magenta

"----------------------------
" #conjure
"----------------------------
let g:conjure#mapping#def_word = v:false
let g:conjure#mapping#doc_word = v:false
let g:conjure#mapping#log_buf = ["<Leader>ll"]
let g:conjure#mapping#log_jump_to_latest = ["<Leader>lj"]
let g:conjure#client#clojure#nrepl#mapping#connect_port_file = ["<Leader>mc"]
let g:conjure#client#clojure#nrepl#mapping#disconnect = ["<Leader>cq"]
let g:conjure#client#clojure#nrepl#mapping#run_current_ns_tests = ["<Leader>tb"]
let g:conjure#client#clojure#nrepl#mapping#session_clone = ["<Leader>bc"]
let g:conjure#client#clojure#nrepl#mapping#session_fresh = ["<Leader>bf"]
let g:conjure#client#clojure#nrepl#mapping#session_close = ["<Leader>bq"]
let g:conjure#client#clojure#nrepl#mapping#session_close_all = ["<Leader>bQ"]
let g:conjure#client#clojure#nrepl#mapping#session_list = ["<Leader>bl"]
let g:conjure#client#clojure#nrepl#mapping#session_next = ["<Leader>bn"]
let g:conjure#client#clojure#nrepl#mapping#session_prev = ["<Leader>bp"]
let g:conjure#client#clojure#nrepl#mapping#session_select = ["<Leader>bs"]

let g:conjure#highlight#enabled = 1
let g:conjure#highlight#timeout = 100
let g:conjure#log#hud#width = 0.40
let g:conjure#log#hud#height = 0.90
let g:conjure#eval#comment_prefix = ";; "
let g:conjure#client#clojure#nrepl#test#runner = "kaocha"
let g:conjure#client#clojure#nrepl#test#call_suffix = "{:kaocha/color? true, :kaocha/reporter [kaocha.report/documentation], :kaocha/capture-output? false, :kaocha.plugin.randomize/randomize? false}"
let g:conjure#client#clojure#nrepl#eval#raw_out = 1
let g:conjure#log#strip_ansi_escape_sequences_line_limit = 0

"custom commands
nnoremap <localleader>tt <cmd>:ConjureEvalBuf<cr><cmd>:ConjureCljRunCurrentTest<cr>
nnoremap <localleader>tn <cmd>:ConjureEvalBuf<cr><cmd>:ConjureCljRunCurrentNsTests<cr>


"----------------------------
" #baleia
"----------------------------
let s:baleia = luaeval("require('baleia').setup { line_starts_at = 3 }")
autocmd BufWinEnter conjure-log-* call s:baleia.automatically(bufnr('%'))


"----------------------------
" #ripgrep
"----------------------------
let g:rg_command = 'rg --vimgrep -S'
command! -nargs=+ -complete=file -bar GrepInsideFile <cmd>:Rg <args> %<cr>
nnoremap <expr> <leader>/ ":Rg " . input('Exact matches in this file: ') . " %<cr>"

"----------------------------
" #airline
"----------------------------
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme = 'papercolor'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
"let g:airline#extensions#default#section_truncate_width = {
"      \ 'x': 100,
"      \ }
"let g:airline#extensions#default#layout = [
"      \ [ 'a', 'b', 'c' ],
"      \ [ 'y', 'z', 'error', 'warning' ]
"      \ ]
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#format = 2
let g:airline_section_c_only_filename = 1
let g:airline_section_x = ''
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
let g:airline_skip_empty_sections = 1
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

"----------------------------
" #indent-blankline
"----------------------------
lua <<EOF
require("indent_blankline").setup {
    show_end_of_line = true,
}
EOF

"----------------------------
" #vim-yankstack
"----------------------------
call yankstack#setup()
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste

"----------------------------
" #ale
"----------------------------
let g:airline#extensions#ale#enabled = 1
"let g:ale_statusline_format = ['E%d', 'W%d', '']
nmap <silent> <Leader>j <Plug>(ale_previous_wrap)
nmap <silent> <Leader>k <Plug>(ale_next_wrap)
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
  \   'clojure': ['clj-kondo'],
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
  \ 'coc-conjure',
  \ ]

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif


nmap <silent><Leader>cr   <Plug>(coc-rename)
xmap <silent><Leader>c    <Plug>(coc-codeaction-selected)
nmap <silent><Leader>c    <Plug>(coc-codeaction-line)
nmap <silent>gd           <Plug>(coc-definition)
nmap <silent>gr           <Plug>(coc-references)
nmap <silent>gi           <Plug>(coc-implementation)
nmap <silent>gy           <Plug>(coc-type-definition)
nmap <silent><C-k>        <Plug>(coc-diagnostic-prev)
nmap <silent><C-j>        <Plug>(coc-diagnostic-next)

"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)


set updatetime=1000

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
" #clojure.vim
"----------------------------
let g:clojure_discard_macro = 1


"----------------------------
" #vim-iced
"----------------------------
" enable default key mapping
"let g:iced_enable_default_key_mappings = v:true
"let g:iced_unable_default_key_mappings = v:true
"
"aug VimIcedAutoFormatOnWriting
"  au!
"  " Format whole buffer on writing files
"  au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSyncAll'
"
"  " Format only current form on writing files
"  " au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSync'
"aug END


"----------------------------
" #vim-iced-fern-debugger
"----------------------------
"let g:iced#debug#debugger = 'fern'


"----------------------------
" #vim-fennel
"----------------------------
" highlight Fennel compiler environment-only functions
let g:fennel_highlight_compiler = 1

" highlight Olical/aniseed keywords
let g:fennel_highlight_aniseed = 1

" highlight ~ioiojo/kiwi keywords
let g:fennel_highlight_kiwi = 1

" highlight rxi/lume keywords
let g:fennel_highlight_lume = 1



"----------------------------
" #rainbow
"----------------------------
let g:rainbow_active = 1



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
" make tabs and line feeds invisible (list = visible)
set nolist
" show long rows without wrapping
set nowrap
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

" kill functionality converting lowercase to prevent accidental typing
" *not to mix it up with undo in normal mode
vnoremap u <Nop>

" kill some binds to prevent accidental typing
vnoremap ZQ <Nop>
vnoremap ZZ <Nop>

"ripgrep
"nnoremap <leader>/ :<C-u>Rg<Space>

" Windows / Panes 
nnoremap s <Nop>
xnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sN gt
nnoremap sP gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
"nnoremap so <C-w>_<C-w>|
nnoremap sn :<C-u>bn<CR>
nnoremap sp :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap so :<C-u>sp<CR> <C-w>_ <C-w>j 5<C-w>+
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap bd :<C-u>bd<CR>
nnoremap bZ :<C-u>%bd\|e#<CR>

" resizing panes
" resize height
nnoremap sdj <C-w>-
nnoremap sdk <C-w>+
" resize width
nnoremap sdh <C-w><
nnoremap sdl <C-w>>
"nnoremap sd= <C-w>=

" Previous buffer
nnoremap <Leader>` <C-^>
