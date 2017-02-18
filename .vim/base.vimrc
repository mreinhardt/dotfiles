" vimrc.vim - Extension of vim-sensible plugin with less sensible defaults.
"             Based on https://github.com/sheerun/vimrc
" Maintainer: Mike Reinhardt

if exists("g:loaded_vimrc") || &cp
  finish
else
  let g:loaded_vimrc = 1
end

"" Basics

" Disable strange Vi defaults.
set nocompatible

" Turn on filetype plugins (:help filetype-plugin).
if has('autocmd')
  silent filetype plugin indent on
endif

" Enable syntax highlighting.
if has('syntax')
  syntax enable
endif

" Autoindent when starting new line, or using `o` or `O`.
set autoindent

" Allow backspace in insert mode.
set backspace=indent,eol,start

" Don't scan included files. The .tags file is more performant.
set complete-=i

" Use 'shiftwidth' when using `<Tab>` in front of a line.
" By default it's used only for shift commands (`<`, `>`).
set smarttab

" Disable octal format for number processing.
set nrformats-=octal

" Allow for mappings including `Esc`, while preserving
" zero timeout after pressing it manually.
set ttimeout
set ttimeoutlen=100

" Enable highlighted case-insensitive incremential search.
set incsearch

" Indent using four spaces.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Use `Ctrl-L` to clear the highlighting of :set hlsearch.
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" Always show window statuses, even if there's only one.
set laststatus=2

" Show the line and column number of the cursor position.
set ruler

" Show the size of block one selected in visual mode.
set showcmd

" Autocomplete commands using nice menu in place of window status.
" Enable `Ctrl-N` and `Ctrl-P` to scroll through matches.
set wildmenu

" When 'wrap' is on, display last line even if it doesn't fit.
set display+=lastline

" Force utf-8 encoding in GVim
if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

" Set default whitespace characters when using `:set list`
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

" Search upwards for tags file instead only locally
if has('path_extra')
  setglobal tags-=./tags tags^=./tags;
endif

" Reload unchanged files automatically.
set autoread

" Support all kind of EOLs by default.
set fileformats+=mac

" Increase history size to 1000 items.
set history=1000

" Allow for up to 50 opened tabs on Vim start.
set tabpagemax=50

" Always save upper case variables to viminfo file.
set viminfo^=!

" Enable backup and undo files by default.
let s:dir = has('win32') ? '$APPDATA/Vim' : isdirectory($HOME.'/Library') ? '~/Library/Vim' : empty($XDG_DATA_HOME) ? '~/.local/share/vim' : '$XDG_DATA_HOME/vim'
let &backupdir = expand(s:dir) . '/backup//'
let &undodir = expand(s:dir) . '/undo//'
set undofile

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif


" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" `Ctrl-U` in insert mode deletes a lot. Use `Ctrl-G` u to first break undo,
" so that you can undo `Ctrl-U` without undoing what you typed before it.
inoremap <C-U> <C-G>u<C-U>

" Avoid problems with fish shell
" ([issue](https://github.com/tpope/vim-sensible/issues/50)).
if &shell =~# 'fish$'
  set shell=/bin/bash
endif

"" Extras

" Set monaco font if using macvim
if has("gui_macvim")
  set guifont=Monaco:h13
endif

" Keep flags when repeating last substitute command.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Y yanks from the cursor to the end of line as expected. See :help Y.
nnoremap Y y$

" Automatically create directories for backup and undo files.
if !isdirectory(expand(s:dir))
  call system("mkdir -p " . expand(s:dir) . "/{backup,undo}")
end

" Highlight line under cursor. It helps with navigation.
set cursorline

" Keep 4 lines above or below the cursor when scrolling.
set scrolloff=4

" Keep 15 columns next to the cursor when scrolling horizontally.
set sidescroll=1
set sidescrolloff=15

" Set minimum window size to 79x5.
set winwidth=79
set winheight=5
set winminheight=5

" If opening buffer, search first in opened windows.
set switchbuf=usetab

" Hide buffers instead of asking if to save them.
set hidden

" Wrap lines by default
"set wrap linebreak
"set showbreak=" "

" Allow easy navigation between wrapped lines.
vmap j gj
vmap k gk
nmap j gj
nmap k gk

" For autocompletion, complete as much as you can.
set wildmode=longest,full

" Show line numbers on the sidebar.
set number

" Disable any annoying beeps on errors.
set noerrorbells
set visualbell

" Don't parse modelines (google "vim modeline vulnerability").
set nomodeline

" Do not fold by default. But if, do it up to 3 levels.
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" Enable mouse for scrolling and window resizing.
" set mouse=a

" Disable mouse explicitly
set mouse=

" Disable swap to prevent annoying messages.
set noswapfile

" Tell vim to remember certain things when we exit
"  '100 :  marks will be remembered for up to 100 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :100 :  up to 100 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
" Also use different viminfo file for neovim
if has('nvim')
    set viminfo='100,\"100,:100,%,n~/.local/share/nvim/viminfo
else
    set viminfo='100,\"100,:100,%,n~/.viminfo
endif

" Restore cursor to previous location when reopening file
function! ResCur()
  if line("'\"") <= line("$")
    try
      normal! g`"
      return 1
    catch
      return 0
    endtry
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Strip trailing whitespace
if has('autocmd')
    autocmd BufWritePre * :%s/\s\+$//e
endif

" Enable search highlighting.
set hlsearch

" Ignore case when searching.
" set ignorecase

" Show mode in statusbar, not separately.
set noshowmode

" Don't ignore case when search has capital letter
" (although also don't ignore case by default).
set smartcase

" Use dash as word separator.
set iskeyword+=-

" Add gems.tags to files searched for tags.
set tags+=gems.tags

" Disable output, vcs, archive, build, temp and backup files.
set wildignore+=*.pyc,*.pyo,*.egg,*.egg-info,.DS_Store
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

" Auto center on matched string.
noremap n nzz
noremap N Nzz

" Visually select the text that was last edited/pasted (Vimcast#26).
noremap gV `[v`]

" Set path to project root
set path=$PWD/**

" Expand %% to path of current buffer in command mode.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Enable saving by `Ctrl-s`
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

" Use Q to intelligently close a window
" (if there are multiple windows into the same buffer)
" or kill the buffer entirely if it's the last window looking into that buffer.
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif
  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction
nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

" Set window title by default.
set title

" Always focus on splited window.
set splitright
set splitbelow

" Don't display the intro message on starting Vim.
set shortmess+=I

" Use Silver Searcher for CtrlP plugin (if available)
" Fallback to git ls-files for fast listing.
" Because we use fast strategies, disable caching.
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'cd %s && ag -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git',
    \ 'cd %s && git ls-files . -co --exclude-standard',
    \ 'find %s -type f' ]
endif

" Accept CtrlP selections also with <Space>
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<Space>', '<CR>', '<2-LeftMouse>'],
  \ }

" Make sure pasting in visual mode doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Prevent common mistake of pressing q: instead :q
" map q: :q

" Make a simple "search" text object.
" http://vim.wikia.com/wiki/Copy_or_change_search_hit
" It allows for replacing search matches with cs and then /././.
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" Custom

" Column markers at 80, 120
if has('autocmd')
  autocmd FileType python set textwidth=79
  autocmd FileType python set colorcolumn=+1,+41
  autocmd FileType clojure set textwidth=99
  autocmd FileType clojure set colorcolumn=+1
else
  set textwidth=99
  set colorcolumn=+1
endif
highlight ColorColumn ctermfg=125 ctermbg=020

" Current line highlight color
highlight CursorLine ctermbg=018

" Transparent background
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE

" Set line numbers in directory view
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" netrw settings
let g:netrw_banner = 0
let g:netrw_browse_split=0  " open in same window
let g:netrw_alto=1          " open splits below
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=1     " detail view

" Automatically show matching brackets
set showmatch

" Set matching bracket color
highlight MatchParen cterm=none ctermbg=232 ctermfg=46


""" Commnads

" Create `tags` file
command! MakeTags !ctags -R .

""" Key bindings

" Leader binding
let mapleader = "\<Space>"

" Ergo
inoremap <C-H> <Left>
inoremap <C-J> <Down>
"inoremap <C-K> <Up>
inoremap <C-L> <Right>
inoremap <C-D> <Esc>

" Jump to end of paste
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Redraw
nnoremap <Leader>l :redraw!<CR>

" Clear search
nnoremap <Leader>/ :let @/ = ""<CR>

" Writes and Quits
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wq<CR>

" vimrcs
nnoremap <Leader>ev :split $MYVIMRC<CR>
nnoremap <Leader>eb :split ~/.vim/base.vimrc<CR>
nnoremap <Leader>rv :so $MYVIMRC<CR>
nnoremap <Leader>rb :so ~/.vim/base.vimrc<CR>

" Toggles
nmap <Leader># :setlocal number! relativenumber!<CR>
nmap <Leader>> :set paste!<CR>
nmap <Leader>< :setlocal wrap!<CR>:setlocal wrap?<CR>

" Dir view
nnoremap <Leader>o :Explore<CR>

" Easier jump to line
nnoremap <CR> G
nnoremap <BS> gg

" Tag jumping
nnoremap <Leader>g g<C-]>

" Split
nnoremap <Leader>sh :split<CR>
nnoremap <Leader>sv :vsplit<CR>

" Move to split
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" Move to buffer
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>b :ls<CR>:b<Space>

" Tabs
nnoremap <Leader>T :tabnew<CR>:b#<BAR>bd#<CR>
nnoremap <Leader>. :tabnext<CR>
nnoremap <Leader>, :tabprev<CR>

" Move lines
nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==
vnoremap <Leader>j :m '>+1<CR>gv=gv
vnoremap <Leader>k :m '<-2<CR>gv=gv

" Surrounds
" inoremap '' ''<ESC>i
" inoremap "" ""<ESC>i
" inoremap (( ()<ESC>i
" inoremap [[ []<ESC>i
" inoremap {{ {}<ESC>i
" inoremap << <><ESC>i

" Toggle tab style
nnoremap <Leader>tt :set noet ci pi sts=0 sw=4 ts=4<CR>
nnoremap <Leader>ts :set et noci nopi sts=4 sw=4 ts=4<CR>

" Find/replace
func FindAndChangeIn()
    let captured_char = nr2char(getchar())
    return 'f' . captured_char . "ci" . captured_char
endfunc
nnoremap <expr> <Leader>fc FindAndChangeIn()

" Emacs style command line movements
:cnoremap <C-a>  <Home>
:cnoremap <C-e>  <End>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>

" Toggle spellcheck
nnoremap <Leader>S :setlocal spell! spelllang=en_us<CR>

if has('nvim')
    tnoremap <esc><esc> <c-\><c-n>
endif

