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

" LSP / linter
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" preferences
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
Plug 'pappasam/papercolor-theme-slim'

" folders and files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jremmen/vim-ripgrep'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
"Plug 'preservim/nerdtree'
"Plug 'jistr/vim-nerdtree-tabs'

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

" js/ts
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
"Plug 'clojure-vim/clojure.vim', {'for': 'clojure'}
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
"Plug 'liquidz/vim-iced', {'for': 'clojure'}
"Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}
"Plug 'lambdalisue/fern.vim'
"Plug 'liquidz/vim-iced-fern-debugger', {'for': 'clojure'}
Plug 'Olical/conjure', {'for': 'clojure'}
"Plug 'm00qek/baleia.nvim', {'tag': 'v1.3.0'}

" fennel
Plug 'atweiden/vim-fennel'

" haskell
Plug 'ndmitchell/ghcid', {'rtp': 'plugins/nvim', 'for': 'haskell' }

" others
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'kevinhwang91/nvim-bqf'
Plug 'will133/vim-dirdiff'
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'hail2u/vim-css3-syntax', {'for': 'css'}


call plug#end()


"-----------------------------------------------------------------------
" Theme
"-----------------------------------------------------------------------
"----------------------------
" #indent-blankline
"----------------------------
"require("indent_blankline").setup {
"    show_end_of_line = true,
"}
lua <<EOF
require("ibl").setup{
  scope = {
    enabled = true,
    show_end = true
  }
}
EOF

if exists("g:neovide")
  set termguicolors
  set background=dark
  colorscheme PaperColorSlim
  let g:neovide_cursor_trail_size = 0.3
  let g:neovide_cursor_vfx_mode = "pixiedust"
  vnoremap <C-S-c> "+y
  nnoremap <C-S-v> "+P
  vnoremap <C-S-v> "+P
  cnoremap <C-S-v> <C-R>+
  inoremap <C-S-v> <C-R>+
else
  set background=dark
  colorscheme PaperColor
endif
set t_Co=256
" The following doesn't work


"-----------------------------------------------------------------------
" Config for plugins
"-----------------------------------------------------------------------
" set leader
let mapleader="\<Space>"
let maplocalleader="\<Space>"
nnoremap <Space> <Nop>

"----------------------------
" #conjure
"----------------------------
let g:conjure#mapping#def_word=v:false
let g:conjure#mapping#doc_word=v:false
let g:conjure#mapping#log_buf=["<Leader>ll"]
let g:conjure#mapping#log_toggle=["<Leader>lt"]
let g:conjure#mapping#log_jump_to_latest=["<Leader>lj"]
let g:conjure#client#clojure#nrepl#mapping#connect_port_file=["<Leader>mc"]
let g:conjure#client#clojure#nrepl#mapping#disconnect=["<Leader>cq"]
let g:conjure#client#clojure#nrepl#mapping#run_current_ns_tests=["<Leader>tb"]
let g:conjure#client#clojure#nrepl#mapping#session_clone=["<Leader>bc"]
let g:conjure#client#clojure#nrepl#mapping#session_fresh=["<Leader>bf"]
let g:conjure#client#clojure#nrepl#mapping#session_close=["<Leader>bq"]
let g:conjure#client#clojure#nrepl#mapping#session_close_all=["<Leader>bQ"]
let g:conjure#client#clojure#nrepl#mapping#session_list=["<Leader>bl"]
let g:conjure#client#clojure#nrepl#mapping#session_next=["<Leader>bn"]
let g:conjure#client#clojure#nrepl#mapping#session_prev=["<Leader>bp"]
let g:conjure#client#clojure#nrepl#mapping#session_select=["<Leader>bs"]

let g:conjure#highlight#enabled=1
let g:conjure#highlight#timeout=100
let g:conjure#log#hud#width=0.40
let g:conjure#log#hud#height=0.90
let g:conjure#log#strip_ansi_escape_sequences_line_limit=0
let g:conjure#eval#comment_prefix=";; "
"let g:conjure#client#clojure#nrepl#test#runner="kaocha"
"let g:conjure#client#clojure#nrepl#test#call_suffix="{:kaocha/color? true, :kaocha/reporter [kaocha.report/documentation], :kaocha/capture-output? false, :kaocha.plugin.randomize/randomize? false}"
let g:conjure#client#clojure#nrepl#eval#raw_out=1

"custom commands
nnoremap <Leader>tt <cmd>:ConjureEvalBuf<cr><cmd>:ConjureCljRunCurrentTest<cr>
nnoremap <Leader>tn <cmd>:ConjureEvalBuf<cr><cmd>:ConjureCljRunCurrentNsTests<cr>


"----------------------------
" #Mason
"----------------------------
"lua <<EOF
"require('mason').setup()
"EOF

""----------------------------
"" #NERDTree
""----------------------------
"" show hidden files
"let NERDTreeShowHidden = 1
"" hide tree by default
"let g:nerdtree_tabs_open_on_console_startup=0
"" close buffer if only nerdtree is remained
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
"" toggle tree
"nnoremap <leader>ff :NERDTreeToggle<CR>
"" find the file where cursor is in tree
"nnoremap <leader>fd :NERDTreeFind<CR>


"----------------------------
" #nvim-tree
"----------------------------
lua <<EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
--require("nvim-tree").setup()

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  --vim.keymap.set('n', '<C-]>',   api.tree.change_root_to_node,        opts('CD'))
  --vim.keymap.set('n', '<C-e>',   api.node.open.replace_tree_buffer,   opts('Open: In Place'))
  --vim.keymap.set('n', '<C-k>',   api.node.show_info_popup,            opts('Info'))
  vim.keymap.set('n', 'mr',      api.fs.rename_sub,                   opts('Rename: Omit Filename'))
  vim.keymap.set('n', 't',       api.node.open.tab,                   opts('Open: New Tab'))
  vim.keymap.set('n', 'v',       api.node.open.vertical,              opts('Open: Vertical Split'))
  vim.keymap.set('n', 'sp',      api.node.open.horizontal,            opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<BS>',    api.node.navigate.parent_close,      opts('Close Directory'))
  vim.keymap.set('n', '<CR>',    api.node.open.edit,                  opts('Open'))
  vim.keymap.set('n', '<Tab>',   api.node.open.preview,               opts('Open Preview'))
  vim.keymap.set('n', 'J',       api.node.navigate.sibling.next,      opts('Next Sibling'))
  vim.keymap.set('n', 'K',       api.node.navigate.sibling.prev,      opts('Previous Sibling'))
  vim.keymap.set('n', '.',       api.node.run.cmd,                    opts('Run Command'))
  vim.keymap.set('n', '-',       api.tree.change_root_to_parent,      opts('Up'))
  vim.keymap.set('n', 'a',       api.fs.create,                       opts('Create File Or Directory'))
  vim.keymap.set('n', 'bd',      api.marks.bulk.delete,               opts('Delete Bookmarked'))
  vim.keymap.set('n', 'bt',      api.marks.bulk.trash,                opts('Trash Bookmarked'))
  vim.keymap.set('n', 'bmv',     api.marks.bulk.move,                 opts('Move Bookmarked'))
  vim.keymap.set('n', 'B',       api.tree.toggle_no_buffer_filter,    opts('Toggle Filter: No Buffer'))
  vim.keymap.set('n', 'c',       api.fs.copy.node,                    opts('Copy'))
  vim.keymap.set('n', 'C',       api.tree.toggle_git_clean_filter,    opts('Toggle Filter: Git Clean'))
  vim.keymap.set('n', '[c',      api.node.navigate.git.prev,          opts('Prev Git'))
  vim.keymap.set('n', ']c',      api.node.navigate.git.next,          opts('Next Git'))
  vim.keymap.set('n', 'd',       api.fs.remove,                       opts('Delete'))
  vim.keymap.set('n', 'D',       api.fs.trash,                        opts('Trash'))
  vim.keymap.set('n', 'E',       api.tree.expand_all,                 opts('Expand All'))
  vim.keymap.set('n', 'e',       api.fs.rename_basename,              opts('Rename: Basename'))
  vim.keymap.set('n', ']e',      api.node.navigate.diagnostics.next,  opts('Next Diagnostic'))
  vim.keymap.set('n', '[e',      api.node.navigate.diagnostics.prev,  opts('Prev Diagnostic'))
  vim.keymap.set('n', 'F',       api.live_filter.clear,               opts('Live Filter: Clear'))
  vim.keymap.set('n', 'f',       api.live_filter.start,               opts('Live Filter: Start'))
  vim.keymap.set('n', 'g?',      api.tree.toggle_help,                opts('Help'))
  vim.keymap.set('n', 'gy',      api.fs.copy.absolute_path,           opts('Copy Absolute Path'))
  vim.keymap.set('n', 'ge',      api.fs.copy.basename,                opts('Copy Basename'))
  vim.keymap.set('n', 'H',       'H',                                  opts(''))
  vim.keymap.set('n', 'I',       api.tree.toggle_gitignore_filter,    opts('Toggle Filter: Git Ignore'))
  --vim.keymap.set('n', 'J',       api.node.navigate.sibling.last,      opts('Last Sibling'))
  --vim.keymap.set('n', 'K',       api.node.navigate.sibling.first,     opts('First Sibling'))
  vim.keymap.set('n', 'L',       'L',                                  opts(''))
  vim.keymap.set('n', 'M',       api.tree.toggle_no_bookmark_filter,  opts('Toggle Filter: No Bookmark'))
  vim.keymap.set('n', 'm',       api.marks.toggle,                    opts('Toggle Bookmark'))
  vim.keymap.set('n', 'o',       api.node.open.edit,                  opts('Open'))
  vim.keymap.set('n', 'O',       api.node.open.no_window_picker,      opts('Open: No Window Picker'))
  vim.keymap.set('n', 'p',       api.fs.paste,                        opts('Paste'))
  vim.keymap.set('n', 'P',       api.node.navigate.parent,            opts('Parent Directory'))
  vim.keymap.set('n', 'q',       api.tree.close,                      opts('Close'))
  vim.keymap.set('n', 'r',       api.fs.rename,                       opts('Rename'))
  vim.keymap.set('n', 'R',       api.tree.reload,                     opts('Refresh'))
  vim.keymap.set('n', 's',       '',                                  opts(''))
  vim.keymap.set('n', 'S',       api.tree.search_node,                opts('Search'))
  vim.keymap.set('n', 'u',       api.fs.rename_full,                  opts('Rename: Full Path'))
  vim.keymap.set('n', 'U',       api.tree.toggle_custom_filter,       opts('Toggle Filter: Hidden'))
  vim.keymap.set('n', 'W',       api.tree.collapse_all,               opts('Collapse'))
  vim.keymap.set('n', 'x',       api.fs.cut,                          opts('Cut'))
  vim.keymap.set('n', 'y',       api.fs.copy.filename,                opts('Copy Name'))
  vim.keymap.set('n', 'Y',       api.fs.copy.relative_path,           opts('Copy Relative Path'))
  --vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
  --vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
end

require("nvim-tree").setup {
  on_attach = my_on_attach,
}
EOF

nnoremap <silent> <Leader>ff :NvimTreeFindFile<CR>:NvimTreeFocus<CR>
nnoremap <silent> <Leader>fd :NvimTreeClose<CR>


"----------------------------
" #toggleterm
"----------------------------
lua <<EOF
require("toggleterm").setup()
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
    width = function()
      return math.floor(vim.o.columns * 0.95)
    end,
    height = function()
      return math.floor(vim.o.lines * 0.9)
    end,
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
EOF


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
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  },
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
require('telescope').load_extension('fzf')
EOF
"hi TelescopeMatching cterm=NONE ctermfg=magenta


"----------------------------
" #tree-sitter
"----------------------------
lua <<EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "clojure", "fennel", "rust", "haskell", "typescript", },
  sync_install = true,
  highlight = {enable = true},
  indent = {enable = true},
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=2


"----------------------------
" #baleia
"----------------------------
"let s:baleia = luaeval("require('baleia').setup { line_starts_at = 3 }")
"autocmd BufWinEnter conjure-log-* call s:baleia.automatically(bufnr('%'))

"----------------------------
" #vim-sexp
"----------------------------
let g:sexp_maxlines = -1

"----------------------------
" #fugitive
"----------------------------
nnoremap <leader>gt :0Gclog<cr>
nnoremap <leader>gT :G log -30<cr>
vnoremap <leader>gt :Gclog<cr>
vnoremap <leader>gt :Gclog<cr>
vnoremap <leader>grl :G reflog -30<cr>
nnoremap <leader>gB :G blame<cr>
nnoremap <leader>gs :G status<cr>
nnoremap <leader>gf :Gdiff<cr>
nnoremap <leader>gpr :G pull --rebase<cr>
nnoremap <leader>gpra :G pull --rebase --autostash<cr>
nnoremap <leader>gpa :G pull --autostash<cr>
nnoremap <leader>gpp :G pull<cr>
nnoremap <leader>gP :G push<cr>

"----------------------------
" #ripgrep
"----------------------------
let g:rg_command = 'rg --vimgrep -S'
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
"let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
"let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'


"----------------------------
" #vim-yankstack
"----------------------------
call yankstack#setup()
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste

"----------------------------
" #ale
"----------------------------
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_statusline_format = ['E%d', 'W%d', '']
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '🔥'
let g:ale_sign_warning = "・"
let g:ale_sign_info = "・"
let g:ale_virtualtext_prefix = '│ '

"autocmd VimEnter * :hi! ALEErrorSign ctermfg=209
"autocmd VimEnter * :hi! ALEWarningSign ctermfg=11
"autocmd VimEnter * :hi! ALEInfoSign   ctermfg=147
"autocmd VimEnter * hi! ALEError ctermfg=9 ctermbg=8
"autocmd VimEnter * hi! ALEWarning ctermbg=8
"autocmd VimEnter * hi! ALEInfo ctermbg=8
hi! ALEVirtualTextError ctermfg=9 ctermbg=236
hi! ALEVirtualTextWarning ctermfg=186 ctermbg=236
hi! ALEVirtualTextInfo ctermfg=147 ctermbg=236

hi link ALEError Error
hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
hi link ALEWarning Warning
hi link ALEInfo SpellCap


" --- enable eslint_d
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

"" change diagnostic color 
"hi! CocErrorSign ctermfg=209
"hi! CocWarningSign ctermfg=186
"hi! CocInfoSign ctermfg=147
"hi! CocErrorVirtualText ctermfg=9 ctermbg=236
"hi! CocWarningVirtualText ctermfg=186 ctermbg=236
"hi! CocInfoVirtualText ctermfg=147 ctermbg=236
"hi! CocErrorHighlight ctermfg=9 ctermbg=8
"hi! CocWarningHighlight ctermbg=8
"hi! CocInfoHighlight ctermbg=8

nmap <silent><Leader>cr   <Plug>(coc-rename)
xmap <silent><Leader>c    <Plug>(coc-codeaction-selected)
nmap <silent><Leader>c    <Plug>(coc-codeaction-line)
nmap <silent>gd           <Plug>(coc-definition)
nmap <silent>gr           <Plug>(coc-references)
nmap <silent>gi           <Plug>(coc-implementation)
nmap <silent>gy           <Plug>(coc-type-definition)
"nmap <silent><C-k>        <Plug>(coc-diagnostic-prev)
"nmap <silent><C-j>        <Plug>(coc-diagnostic-next)
nmap <silent>K            <cmd>:call <SID>show_documentation()<CR>
nmap <silent><Leader>ci   <cmd>:call CocActionAsync('showIncomingCalls')<CR>
nmap <silent><Leader>co   <cmd>:call CocActionAsync('showOutgoingCalls')<CR>

autocmd FileType cljc let b:coc_suggest_disable = 1

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"function! Expand(exp) abort
"    let l:result = expand(a:exp)
"    return l:result ==# '' ? '' : "file://" . l:result
"endfunction

" Highlight symbol under cursor on CursorHold      
autocmd CursorHold * silent call CocActionAsync('highlight')

"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)


set updatetime=300

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
"let g:clojure_discard_macro = 1


""----------------------------
"" #vim-iced
""----------------------------
"let g:spr = v:true
"
"" enable default key mapping
""let g:iced_enable_default_key_mappings = v:true
"let g:iced_unable_default_key_mappings = v:true
"
"let g:iced#buffer#stdout#mods = 'vertical'
"let g:iced#buffer#stdout#enable_notify = v:true
"let g:iced#buffer#stdout#enable_delimiter = v:true
"let g:iced#notify#max_height_rate = 0.9
"let g:iced#notify#max_width_rate = 0.4
"
""disable syntax checking on stdout buffer
"call iced#hook#add('connected', {
"      \ 'type': 'function',
"      \ 'exec': {_ -> lsp#disable_diagnostics_for_buffer(bufnr('iced_stdout'))},
"      \ })
"call iced#hook#add('connected', {
"      \ 'type': 'function',
"      \ 'exec': {_ -> ale#toggle#DisableBuffer(bufnr('iced_stdout'))},
"      \ })
"call iced#hook#add('connected', {
"      \ 'type': 'function',
"      \ 'exec': {_ -> CocAction('diagnosticToggleBuffer', bufnr('iced_stdout'))},
"      \ })
"
"aug VimIcedAutoFormatOnWriting
"  au!
"  " Format whole buffer on writing files
"  au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSyncAll'
"
"  " Format only current form on writing files
"  " au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSync'
"aug END
"
"function! s:define_mapping(map_type, default_keys, plug_name) abort
"  if !hasmapto(a:plug_name)
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
"  call s:define_mapping('nmap', "<Leader>mc", '<Plug>(iced_connect)')
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
"  "call s:define_mapping('nmap', '<Leader>eB', '<Plug>(iced_require_all)')
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
"  call s:define_mapping('nmap', '<Leader>ll', '<Plug>(iced_stdout_buffer_toggle)')
"  call s:define_mapping('nmap', '<Leader>lc', '<Plug>(iced_stdout_buffer_clear)')
"  "call s:define_mapping('nmap', '<Leader>so', '<Plug>(iced_stdout_buffer_open)')
"  "call s:define_mapping('nmap', '<Leader>sq', '<Plug>(iced_stdout_buffer_close)')
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
"
"
""----------------------------
"" #vim-iced-fern-debugger
""----------------------------
"let g:iced#debug#debugger = 'fern'
"
"
""----------------------------
"" #vim-fennel
""----------------------------
"" highlight Fennel compiler environment-only functions
"let g:fennel_highlight_compiler = 1
"
"" highlight Olical/aniseed keywords
"let g:fennel_highlight_aniseed = 1
"
"" highlight ~ioiojo/kiwi keywords
"let g:fennel_highlight_kiwi = 1
"
"" highlight rxi/lume keywords
"let g:fennel_highlight_lume = 1


"----------------------------
" #ghcid
"----------------------------
nnoremap <leader>l :Ghcid<CR>



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
" disable 'cursorline'
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
set viminfo=%,<800,'10,/50,:100,h,f0,n~/.vim/tmp/info/.viminfo
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
"set title

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
" Yank
"----------------------------
" register yanked string to clipboard
"set clipboard=unnamedplus

"---------------------------
" Folding
"---------------------------
"set foldmethod=syntax
""set foldmethod=indent   
"set foldnestmax=10
"set foldenable
"set foldlevel=2

"----------------------------
" Key mapping
"----------------------------
" swap colon with semicolon
noremap ; :
noremap : ;

" asign esc key to 'jj'
inoremap <silent> jj <ESC>

" toggle paste mode
"set pastetoggle=<F2>
nnoremap <F2> :set invpaste<CR>

" reload syntax highlighting
noremap <F5> <Esc>:syntax sync fromstart<CR>
inoremap <F5> <C-o>:syntax sync fromstart<CR>

" kill some binds to prevent accidental typing
vnoremap ZQ <Nop>
vnoremap ZZ <Nop>

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
nnoremap sn :<C-u>bn<CR>
nnoremap sp :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
"nnoremap so :<C-u>sp<CR> <C-w>_ <C-w>j 5<C-w>+
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap bd :<C-u>bd<CR>
nnoremap bZ :<C-u>%bd\|e#\|bd#<CR>\|'"


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

" hide tabline
set showtabline=0
nnoremap <silent> <leader>tg :execute 'set showtabline=' . (&showtabline ==# 0 ? 2 : 0)<cr>
