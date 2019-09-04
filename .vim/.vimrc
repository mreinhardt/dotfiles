" Mike Reinhardt .vimrc
" Requires https://github.com/junegunn/vim-plug


execute "source $HOME/.vim/base.vimrc"

" Plugins
call plug#begin()
  Plug 'ervandew/supertab'
  Plug 'godlygeek/tabular'
  Plug 'SirVer/ultisnips'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
  Plug 'justinmk/vim-sneak'
  Plug 'mreinhardt/nvim-pfix', { 'do': ':UpdateRemotePlugins' }
  Plug 'tpope/vim-repeat'
  Plug 'easymotion/vim-easymotion'
  Plug 'vim-scripts/ag.vim'
  Plug 'honza/vim-snippets'
  Plug 'tpope/vim-fugitive'
  Plug 'tomtom/tcomment_vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'ruanyl/vim-gh-line'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi'
  Plug 'sukima/xmledit'
  Plug 'vim-syntastic/syntastic'
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-airline/vim-airline'
  Plug 'bling/vim-bufferline'
  Plug 'junegunn/vader.vim'
  " Language Specific
  Plug 'hdima/python-syntax'
  Plug 'davidhalter/jedi-vim'
  Plug 'nvie/vim-flake8'
  Plug 'pangloss/vim-javascript'
  Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss']}
  Plug 'elzr/vim-json'
  Plug 'vim-scripts/CSSMinister'
  Plug 'plasticboy/vim-markdown'
  Plug 'guns/vim-clojure-static'
  Plug 'tpope/vim-classpath'
  Plug 'tpope/vim-fireplace'
  Plug 'guns/vim-clojure-highlight'
  Plug 'raichoo/haskell-vim'
  Plug 'fbernier/nginx-vim-syntax'
  Plug 'stephpy/vim-php-cs-fixer'
  " Themes and Colors
  Plug 'lilydjwg/colorizer'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'mreinhardt/papercolor-kelp'
call plug#end()


set t_ut=  " ensure tmux colors work correctly
set background=dark
let g:PaperColor_Theme = 'kelp'
colorscheme PaperColor

" transparent bg
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE


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

" deoplete
let g:python3_host_prog = "/usr/bin/python3.6"
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
let g:syntastic_python_checkers = ['pylint']

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

nnoremap <silent> e[ :lprev<CR>
nnoremap <silent> e] :lnext<CR>

filetype indent off
filetype plugin indent on

