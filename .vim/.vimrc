" Mike Reinhardt .vimrc
" Requires https://github.com/junegunn/vim-plug


execute "source $HOME/.vim/base.vimrc"

" Plugins
call plug#begin()
  Plug 'airblade/vim-gitgutter'
  Plug 'bling/vim-bufferline'
  Plug 'easymotion/vim-easymotion'
  Plug 'ervandew/supertab'
  Plug 'godlygeek/tabular'
  Plug 'honza/vim-snippets'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
  Plug 'junegunn/gv.vim'
  Plug 'junegunn/vader.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'justinmk/vim-sneak'
  Plug 'mbbill/undotree'
  Plug 'mhinz/vim-startify'
  Plug 'mreinhardt/nvim-pfix', { 'do': ':UpdateRemotePlugins' }
  Plug 'preservim/vimux'
  Plug 'raimondi/delimitmate'
  Plug 'ruanyl/vim-gh-line'
  Plug 'sheerun/vim-polyglot'
  Plug 'SirVer/ultisnips'
  Plug 'sukima/xmledit'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-scripts/ag.vim'
  Plug 'vim-syntastic/syntastic'
  Plug 'yggdroot/indentline'
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'zchee/deoplete-jedi'
  " Language Specific
  Plug 'artur-shaik/vim-javacomplete2'
  Plug 'davidhalter/jedi-vim'
  Plug 'elzr/vim-json'
  Plug 'fbernier/nginx-vim-syntax'
  Plug 'guns/vim-clojure-highlight'
  Plug 'guns/vim-clojure-static'
  Plug 'hdima/python-syntax'
  Plug 'nvie/vim-flake8'
  Plug 'pangloss/vim-javascript'
  Plug 'plasticboy/vim-markdown'
  Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss']}
  Plug 'raichoo/haskell-vim'
  Plug 'stephpy/vim-php-cs-fixer'
  Plug 'tpope/vim-classpath'
  Plug 'tpope/vim-fireplace'
  Plug 'vim-scripts/CSSMinister'
  " Themes and Colors
  Plug 'lilydjwg/colorizer'
  Plug 'mreinhardt/papercolor-cyborg'
  Plug 'mreinhardt/papercolor-kelp'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

function! InitVimRcColors()
  set t_ut=  " ensure tmux colors work correctly
  set background=dark
  " let g:PaperColor_Theme = 'kelp'
  let g:PaperColor_Theme = 'cyborg'
  colorscheme PaperColor

  " transparent bg
  hi Normal guibg=NONE ctermbg=NONE
  hi NonText guibg=NONE ctermbg=NONE
endfunction
call InitVimRcColors()

let mapleader = "\<Space>"
set relativenumber

" Bufferline
let g:bufferline_echo=0
let g:bufferline_show_bufnr=0

" Airline
let g:airline_theme='onedark'
let g:airline#extensions#bufferline#enabled=1
let g:airline#extensions#ctrlp#enabled=1
let g:airline#extensions#netrw#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#virtualenv#enabled=1
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=1

" Cycle selection expansion
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" FZF
let g:fzf_layout = {'down': '~40%'}
nnoremap <C-p> :FZF<CR>

" greplace
let g:greplace_cmd='ag'
let g:greplace_cmd_opts='--recurse --hidden --numbers --noheading'

" nvim-pfix
let g:nvim_pfix_pfind='rg'
let g:nvim_pfix_pfind_opts='--hidden --line-number --no-heading'
nnoremap <M-f> :Pfind<CR>
nnoremap <M-r> :Pfix<CR>

" tcomment
nnoremap <Leader>__ :TComment<CR>
nnoremap <Leader>-- :TComment<CR>

" delimitmate
let g:delimitMate_offByDefault=1

" deoplete
let g:python3_host_prog = "/usr/bin/python3.8"
let g:deoplete#enable_at_startup = 1

" UltiSnips
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetsDir="~/.vim/ultisnips"
let g:UltiSnipsSnippetDirectories=["ultisnips"]
nnoremap <Leader>es :split ~/.vim/ultisnips<CR>
nnoremap <Leader>ue :UltiSnipsEdit<CR>

" Syntastic
set statusline+="%#warningmsg#"
set statusline+="%{SyntasticStatuslineFlag()}"
set statusline+="%*"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_python_checkers = ['pylint', 'python']
let g:syntastic_python_python_exec = 'python3'

" indentline
let g:indentLine_enabled = 0
let g:indentLine_char = '▏'
" enable in filetypes, i.e. yaml

" undotree
nnoremap <Leader>ut :UndotreeToggle<CR>
let g:undotree_WindowLayout = 4
let g:undotree_ShortIndicators = 1
let g:undotree_SplitWidth = 21
let g:undotree_DiffpanelHeight = 6
let g:undotree_TreeNodeShape = '¤'
let g:undotree_TreeVertShape = '│'

" Goyo
function! s:goyo_enter()
  " tmux zoom pane
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  " Custom disables
  set wrap linebreak
  set eventignore=BufWinEnter,CursorMoved,CursorMovedI,FocusLost,InsertEnter,InsertLeave,WinEnter
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif

  " Custom enables
  set eventignore=""
  call InitVimRcColors()
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" python-syntax
let python_highlight_all = 1

" vim-markdown
let g:vim_markdown_no_default_key_mappings = 1

" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`

" vim-javacoplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" Default mappings:
"   nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
"   nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
"   nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
"   nmap <leader>jii <Plug>(JavaComplete-Imports-Add)
"   imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
"   imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
"   imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
"   imap <C-j>ii <Plug>(JavaComplete-Imports-Add)
"   nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)
"   imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)
"   nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
"   nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
"   nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
"   nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
"   nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
"   nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
"   nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
"   nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)
"   imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
"   imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
"   imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)
"   vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
"   vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
"   vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
"   nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
"   nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)

nnoremap <silent> e[ :lprev<CR>
nnoremap <silent> e] :lnext<CR>

filetype indent off
filetype plugin indent on

