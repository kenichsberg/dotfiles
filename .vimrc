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
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
Plug 'luochen1990/rainbow'
Plug 'lambdalisue/fern.vim'
Plug 'liquidz/vim-iced-fern-debugger', {'for': 'clojure'}


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
" #CtrlP
"----------------------------
let g:ctrlp_map = '' 
nnoremap <Leader><Space> :CtrlP <cr>

"----------------------------
" #ripgrep
"----------------------------
let g:rg_command = 'rg --vimgrep -S'


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
call yankstack#setup()
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste

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
" #clojure.vim
"----------------------------
let g:clojure_discard_macro = 1


"----------------------------
" #vim-iced
"----------------------------
" enable default key mapping
"let g:iced_enable_default_key_mappings = v:true
let g:iced_unable_default_key_mappings = v:true

aug VimIcedAutoFormatOnWriting
  au!
  " Format whole buffer on writing files
  au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSyncAll'

  " Format only current form on writing files
  " au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSync'
aug END


"----------------------------
" #vim-iced-fern-debugger
"----------------------------
let g:iced#debug#debugger = 'fern'


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
nnoremap <leader>/ :<C-u>Rg<Space>

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

" clojure-lsp
nmap <silent> <Leader>cr      <Plug>(coc-rename)
nmap <silent> gr              <Plug>(coc-references)
xmap <silent> <Leader>c       <Plug>(coc-codeaction-selected)
nmap <silent> <Leader>c       <Plug>(coc-codeaction-line)
nmap <silent> gd              <Plug>(coc-definition)

"" vim-iced
"function! s:define_mapping(map_type, default_keys, plug_name) abort if !hasmapto(a:plug_name)
"    let keys = substitute(a:default_keys, '<Leader>', g:iced_default_key_mapping_leader, '')
"    let cmd = printf('%s <buffer> %s %s',
"          \ a:map_type,
"          \ keys,
"          \ a:plug_name,
"          \ )
"    call execute(cmd, 'silent!')
"  endif
"endfunction
"
"function! s:default_key_mappings() abort
"  if exists('b:iced_default_key_mappings_applied')
"    return
"  endif
"  let b:iced_default_key_mappings_applied = v:true
"
"  call s:define_mapping('nmap', "<Leader>'", '<Plug>(iced_connect)')
"
"  "" Evaluating (<Leader>e)
"  "" ------------------------------------------------------------------------
"  call s:define_mapping('nmap', '<Leader>eq', '<Plug>(iced_interrupt)')
"  call s:define_mapping('nmap', '<Leader>eQ', '<Plug>(iced_interrupt_all)')
"  call s:define_mapping('nmap', '<Leader>"',  '<Plug>(iced_jack_in)')
"
"  if !hasmapto('<Plug>(iced_eval)')
"    "call s:define_mapping('nmap', '<Leader>ei', '<Plug>(iced_eval)<Plug>(sexp_inner_element)``')
"    "call s:define_mapping('nmap', '<Leader>ee', '<Plug>(iced_eval)<Plug>(sexp_outer_list)``')
"    "call s:define_mapping('nmap', '<Leader>et', '<Plug>(iced_eval_outer_top_list)')
"    call s:define_mapping('nmap', '<Leader>ew', '<Plug>(iced_eval)<Plug>(sexp_inner_element)``')
"    call s:define_mapping('nmap', '<Leader>ee', '<Plug>(iced_eval)<Plug>(sexp_outer_list)``')
"    call s:define_mapping('nmap', '<Leader>er', '<Plug>(iced_eval_outer_top_list)')
"    call s:define_mapping('nmap', '<Leader>pew', '<Plug>(iced_eval)<Plug>(sexp_inner_element)``<Plug>(iced_print_last)<Plug>(iced_stdout_buffer_open)')
"    call s:define_mapping('nmap', '<Leader>pee', '<Plug>(iced_eval)<Plug>(sexp_outer_list)``<Plug>(iced_print_last)<Plug>(iced_stdout_buffer_open)')
"    call s:define_mapping('nmap', '<Leader>per', '<Plug>(iced_eval_outer_top_list)<Plug>(iced_print_last)<Plug>(iced_stdout_buffer_open)')
"  endif
"
"  if !hasmapto('<Plug>(iced_eval_in_context)')
"    call s:define_mapping('nmap', '<Leader>ece', '<Plug>(iced_eval_in_context)<Plug>(sexp_outer_list)``')
"  endif
"
"  if !hasmapto('<Plug>(iced_eval_isolatedly)')
"    call s:define_mapping('nmap', '<Leader>eoi', '<Plug>(iced_eval_isolatedly)<Plug>(sexp_inner_element)``' )
"    call s:define_mapping('nmap', '<Leader>eoe', '<Plug>(iced_eval_isolatedly)<Plug>(sexp_outer_list)``' )
"  endif
"
"  call s:define_mapping('nmap', '<Leader>ea', '<Plug>(iced_eval_at_mark)')
"  call s:define_mapping('nmap', '<Leader>eca', '<Plug>(iced_eval_in_context_at_mark)')
"  call s:define_mapping('nmap', '<Leader>el', '<Plug>(iced_eval_last_outer_top_list)')
"  call s:define_mapping('vmap', '<Leader>ee', '<Plug>(iced_eval_visual)')
"  call s:define_mapping('nmap', '<Leader>en', '<Plug>(iced_eval_ns)')
"  "call s:define_mapping('nmap', '<Leader>ep', '<Plug>(iced_print_last)<Plug>(iced_stdout_buffer_open)')
"  call s:define_mapping('nmap', '<Leader>eb', '<Plug>(iced_require)')
"  call s:define_mapping('nmap', '<Leader>eB', '<Plug>(iced_require_all)')
"  call s:define_mapping('nmap', '<Leader>eu', '<Plug>(iced_undef)')
"  call s:define_mapping('nmap', '<Leader>eU', '<Plug>(iced_undef_all_in_ns)')
"  call s:define_mapping('nmap', '<Leader>eM', '<Plug>(iced_macroexpand_outer_list)')
"  call s:define_mapping('nmap', '<Leader>em', '<Plug>(iced_macroexpand_1_outer_list)')
"  call s:define_mapping('nmap', '<Leader>enr', '<Plug>(iced_refresh)')
"
"  "" Testing (<Leader>t)
"  "" ------------------------------------------------------------------------
"  call s:define_mapping('nmap', '<Leader>tt', '<Plug>(iced_test_under_cursor)')
"  call s:define_mapping('nmap', '<Leader>tl', '<Plug>(iced_test_rerun_last)')
"  call s:define_mapping('nmap', '<Leader>ts', '<Plug>(iced_test_spec_check)')
"  call s:define_mapping('nmap', '<Leader>to', '<Plug>(iced_test_buffer_open)')
"  call s:define_mapping('nmap', '<Leader>tn', '<Plug>(iced_test_ns)')
"  call s:define_mapping('nmap', '<Leader>tp', '<Plug>(iced_test_all)')
"  call s:define_mapping('nmap', '<Leader>tr', '<Plug>(iced_test_redo)')
"
"  "" Stdout buffer (<Leader>s)
"  "" ------------------------------------------------------------------------
"  call s:define_mapping('nmap', '<Leader>ss', '<Plug>(iced_stdout_buffer_toggle)')
"  call s:define_mapping('nmap', '<Leader>mc', '<Plug>(iced_stdout_buffer_clear)')
"  call s:define_mapping('nmap', '<Leader>so', '<Plug>(iced_stdout_buffer_open)')
"  call s:define_mapping('nmap', '<Leader>sq', '<Plug>(iced_stdout_buffer_close)')
"
"  "" Refactoring (<Leader>r)
"  "" ------------------------------------------------------------------------
"  call s:define_mapping('nmap', '<Leader>rcn', '<Plug>(iced_clean_ns)')
"  call s:define_mapping('nmap', '<Leader>rca', '<Plug>(iced_clean_all)')
"  call s:define_mapping('nmap', '<Leader>ram', '<Plug>(iced_add_missing)')
"  call s:define_mapping('nmap', '<Leader>ran', '<Plug>(iced_add_ns)')
"  call s:define_mapping('nmap', '<Leader>rtf', '<Plug>(iced_thread_first)')
"  call s:define_mapping('nmap', '<Leader>rtl', '<Plug>(iced_thread_last)')
"  call s:define_mapping('nmap', '<Leader>ref', '<Plug>(iced_extract_function)')
"  call s:define_mapping('nmap', '<Leader>raa', '<Plug>(iced_add_arity)')
"  call s:define_mapping('nmap', '<Leader>rml', '<Plug>(iced_move_to_let)')
"  call s:define_mapping('nmap', '<Leader>rrs', '<Plug>(iced_rename_symbol)')
"
"  "" Help/Document (<Leader>h)
"  "" ------------------------------------------------------------------------
"  call s:define_mapping('nmap', 'K',          '<Plug>(iced_document_popup_open)')
"  call s:define_mapping('nmap', '<Leader>hb', '<Plug>(iced_document_open)')
"  call s:define_mapping('nmap', '<Leader>hu', '<Plug>(iced_use_case_open)')
"  call s:define_mapping('nmap', '<Leader>hn', '<Plug>(iced_next_use_case)')
"  call s:define_mapping('nmap', '<Leader>hN', '<Plug>(iced_prev_use_case)')
"  call s:define_mapping('nmap', '<Leader>hq', '<Plug>(iced_document_close)')
"  call s:define_mapping('nmap', '<Leader>hS', '<Plug>(iced_source_show)')
"  call s:define_mapping('nmap', '<Leader>hs', '<Plug>(iced_source_popup_show)')
"  call s:define_mapping('nmap', '<Leader>hc', '<Plug>(iced_clojuredocs_open)')
"  call s:define_mapping('nmap', '<Leader>hh', '<Plug>(iced_command_palette)')
"
"  "" Browsing (<Leader>b)
"  "" ------------------------------------------------------------------------
"  call s:define_mapping('nmap', '<Leader>bn',  '<Plug>(iced_browse_related_namespace)')
"  call s:define_mapping('nmap', '<Leader>bs',  '<Plug>(iced_browse_spec)')
"  call s:define_mapping('nmap', '<Leader>bt',  '<Plug>(iced_browse_test_under_cursor)')
"  call s:define_mapping('nmap', '<Leader>br',  '<Plug>(iced_browse_references)')
"  call s:define_mapping('nmap', '<Leader>bd',  '<Plug>(iced_browse_dependencies)')
"
"  "" Jumping cursor (<Leader>j)
"  "" ------------------------------------------------------------------------
"  call s:define_mapping('nmap', '<C-]>',      '<Plug>(iced_def_jump)')
"  call s:define_mapping('nmap', '<Leader>jn', '<Plug>(iced_jump_to_next_sign)')
"  call s:define_mapping('nmap', '<Leader>jN', '<Plug>(iced_jump_to_prev_sign)')
"  call s:define_mapping('nmap', '<Leader>jl', '<Plug>(iced_jump_to_let)')
"
"  "" Debugging (<Leader>d)
"  "" ------------------------------------------------------------------------
"  call s:define_mapping('nmap', '<Leader>dbt', '<Plug>(iced_browse_tapped)')
"  call s:define_mapping('nmap', '<Leader>dlt', '<Plug>(iced_clear_tapped)')
"
"  "" Misc
"  "" ------------------------------------------------------------------------
"  call s:define_mapping('nmap', '==',         '<Plug>(iced_format)')
"  call s:define_mapping('nmap', '=G',         '<Plug>(iced_format_all)')
"  "call s:define_mapping('nmap', '<Leader>*',  '<Plug>(iced_grep)')
"  "call s:define_mapping('nmap', '<Leader>/',  ':<C-u>IcedGrep<Space>')
"  call s:define_mapping('nmap', '<Leader>yn', '<Plug>(iced_yank_ns_name)')
"endfunction
"
"if exists('g:iced_unable_default_key_mappings')
"      \ && g:iced_unable_default_key_mappings
"  silent! call s:default_key_mappings()
"  aug iced_default_key_mappings
"    au!
"    au FileType clojure call s:default_key_mappings()
"  aug END
"endif
