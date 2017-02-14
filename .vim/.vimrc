" Mike Reinhardt .vimrc
" Requires https://github.com/junegunn/vim-plug


execute "source $HOME/.vim/base.vimrc"

set t_Co=256
set t_ut=  " ensure tmux colors work correctly
set background=dark
colorscheme arcadia
let g:arcadia_Campfire=1

" transparent bg
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE

" Plugins
call plug#begin()
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
Plug 'justinmk/vim-sneak'
Plug 'mreinhardt/nvim-pfix', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/ag.vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'sukima/xmledit'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-markdown'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'lilydjwg/colorizer'
Plug 'vim-scripts/CSSMinister'
Plug 'junegunn/vader.vim'
call plug#end()


let mapleader = "\<Space>"
set relativenumber

" Bufferline
let g:bufferline_echo=0
let g:bufferline_show_bufnr=0

" Airline
let g:airline_theme='behelit'
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
let g:fzf_layout = {'down': '~20%'}
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
let g:syntastic_loc_list_height=5
if $VIRTUAL_ENV != ""
  let g:syntastic_custom_pylint = $VIRTUAL_ENV . "/bin/pylint"
else
  let g:syntastic_custom_pylint = "pylint"
end
let g:syntastic_python_checkers = ["python", g:syntastic_custom_pylint]

nnoremap <silent> e[ :lprev<CR>
nnoremap <silent> e] :lnext<CR>

filetype indent off
filetype plugin indent on

