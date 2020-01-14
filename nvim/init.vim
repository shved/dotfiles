set nocompatible

" ===========================================================
" ====================== VIM-PLUG STUFF =======================
" ===========================================================

call plug#begin(stdpath('data') . '/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'itchyny/lightline.vim'
  Plug 'godlygeek/csapprox'
  Plug 'tpope/vim-git'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'JazzCore/ctrlp-cmatcher'
  Plug 'junegunn/fzf'
  Plug 'rking/ag.vim'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-session'
  Plug 'nelstrom/vim-visual-star-search'
  Plug 'tomtom/tcomment_vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-scripts/ReplaceWithRegister'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'vim-ruby/vim-ruby'
  Plug 'fatih/vim-go'
  Plug 'rust-lang/rust.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" ======================= ctrlp stuff ========================

" Default to filename searches - so that appctrl will find application controller
let g:ctrlp_by_filename = 1

" Don't jump to already open window. This is annoying if you are maintaining
" several Tab workspaces and want to open two windows into the same file.
let g:ctrlp_switch_buffer = 0

let g:ctrlp_map = ',t'
nnoremap <silent> ,t :CtrlP<CR>

" =============================================================

" Use status bar even with single buffer
set laststatus=2

" ======================== syntastic ========================
"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"show the error list automatically
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
"don't care about warnings
let g:syntastic_quiet_messages = {'level': 'warnings'}

" ===========================================================

" Prevent vim-session from asking us to load the session.
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" ===========================================================
" ========================= MY STUFF ========================
" ===========================================================

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.out,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescroll=1
set sidescrolloff=15

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital


" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

let g:yankring_history_file = '.yankring-history'

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowritebackup
set nowb


" =================== Appearance ====================
colorscheme pencil
set background=dark
let g:pencil_gutter_color = 1

let g:lightline = {
      \ 'colorscheme': 'PaperColor_dark',
      \ 'component_function': {
      \     'filename': 'LightLineFilename'
      \   }
      \ }

function! LightLineFilename()
  return expand('%')
endfunction

hi search cterm=none ctermfg=yellow ctermbg=brown

" ==== NERD tree
" Open the project tree and expose current file in the nerdtree with Ctrl-\
" " calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! OpenNerdTree()
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction
nnoremap <silent> <C-\> :call OpenNerdTree()<CR>
let NERDTreeShowHidden=1

" Make window close if nerdtree is the last opened buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <CR> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize=44

" some stuff to get the mouse going in term
set mouse=a
set clipboard+=unnamed

set listchars=tab:>–,trail:~,extends:>,precedes:<,nbsp:+
set list

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
set hidden
"turn on syntax highlighting
syntax on
syntax enable

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" tabs
" new tab
nmap tn :tabnew<CR>
vmap tn <ESC>:tabnew<CR>

" next tab
nmap tl :execute ':tabnext'<CR>
vmap tl <Esc>:execute ':tabnext'<CR>

" previous tab
nmap th :execute ':tabprevious'<CR>
vmap th <Esc>:execute ':tabprevious'<CR>

" close tab
nmap td :execute ':tabclose'<CR>
vmap td <Esc>:execute ':tabclose'<CR>

" keep cursor position after yanking
vmap y y`]

set cmdheight=2

set incsearch "find the next match as we type the search

set foldmethod=manual

set textwidth=80

set pastetoggle=<F10>

set wrap linebreak
set showbreak=" "

set textwidth=0 wrapmargin=0

:let g:session_autosave = 'no'
:let g:ctrlp_by_filename = 0

highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%121v', 100)
if exists("*matchadd")
  augroup colorColumn
    au!
    au VimEnter,WinEnter * call matchadd('ColorColumn', '\%121v', 100)
  augroup END
endif

" set keymap=russian-jcukenwin
" set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

hi Search cterm=NONE ctermfg=black ctermbg=yellow

set re=1

" vim-ruby indent style
let g:ruby_indent_block_style = 'do'
let ruby_operators = 1
let ruby_pseudo_operators = 1

" ================ Split navigation ==============

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" ============ VIm Sessions plugin ==============

" Don't save hidden and unloaded buffers in sessions.
set sessionoptions-=buffers

" Disable all session locking
let g:session_lock_enabled = 0

" ================ Indentation ======================

" ==================== COC ==========================

" Reduce updatetime from 4000 to 300 to avoid issues with coc.nvim
set updatetime=300

set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:coc_global_extensions = ['coc-solargraph']

" ===================================================

set nu
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType go setlocal ts=4 sts=4 sw=4
" au FileType go setlocal omnifunc=go#complete#GocodeComplete

" Auto indent pasted text
nnoremap p p=`]
nnoremap P P=`]

set shell=/usr/local/bin/zsh

nnoremap ,r :so ~/.config/nvim/init.vim<CR>
