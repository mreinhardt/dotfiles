" get latest vim daily first
" sudo add-apt-repository ppa:pkg-vim/vim-daily
" sudo apt-get update && sudo apt-get upgrade

" ensure global vimrc loaded
execute "source /etc/vim/vimrc"

" set default 'runtimepath' (without ~/.vim folders)
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

" what is the name of the directory containing this file?
let s:portable = expand('<sfile>:p:h')

" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)

" Mike Reinhardt .vimrc
" Requires https://github.com/junegunn/vim-plug

execute "source $HOME/.mvim/base.vimrc"

set t_Co=256
set t_ut=  " ensure tmux colors work correctly
set background=dark
colorscheme lapis256
" lapis overrides
  highlight ColorColumn ctermfg=125 ctermbg=020
  highlight CursorLine ctermbg=018


" Plugins
call plug#begin()
Plug 'eiginn/netrw'
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'sukima/xmledit'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-markdown'
Plug 'lilydjwg/colorizer'
call plug#end()


" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Cycle selection expansion
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" UltiSnips
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetsDir="~/.vim/ultisnips"
let g:UltiSnipsSnippetDirectories=["ultisnips"]
nnoremap <Leader>es :split ~/.vim/ultisnips<CR>
nnoremap <Leader>ue :UltiSnipsEdit<CR>

" Filetypes
filetype indent off
au BufRead,BufNewFile *.sls set filetype=yaml
au BufRead,BufNewFile *.erb set filetype=eruby.html
