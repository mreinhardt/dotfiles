" Mike Reinhardt .vimrc
" Requires https://github.com/junegunn/vim-plug


execute "source $HOME/.vim/base.vimrc"

" Plugins
call plug#begin()
  Plug 'airblade/vim-gitgutter'
  Plug 'bling/vim-bufferline'
  Plug 'easymotion/vim-easymotion'
  Plug 'godlygeek/tabular'
  Plug 'honza/vim-snippets'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
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
  Plug 'sukima/xmledit'
  Plug 'tomtom/tcomment_vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-scripts/ag.vim'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'github/copilot.vim'
  Plug 'CopilotC-Nvim/CopilotChat.nvim'
  Plug 'yggdroot/indentline'
  Plug 'dummyunit/vim-fastbuild'
  " Language Specific
  Plug 'artur-shaik/vim-javacomplete2'
  Plug 'davidhalter/jedi-vim'
  Plug 'elzr/vim-json'
  Plug 'fbernier/nginx-vim-syntax'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'guns/vim-clojure-highlight'
  Plug 'guns/vim-clojure-static'
  Plug 'hdima/python-syntax'
  Plug 'nvie/vim-flake8'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'plasticboy/vim-markdown'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
  Plug 'AndrewRadev/splitjoin.vim'
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

  " more visible cursor
  hi Cursor cterm=NONE ctermbg=69 guibg=#558FCF
  hi CursorLine cterm=NONE ctermbg=234 guibg=#1C1C1C
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
" let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#coc#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#virtualenv#enabled=1
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=1
" let g:airline#extensions#disable_rtp_load=1

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
let g:python3_host_prog = "/opt/homebrew/bin/python3.9"
let g:deoplete#enable_at_startup = 1

" Syntastic
" set statusline+="%#warningmsg#"
" set statusline+="%{SyntasticStatuslineFlag()}"
" set statusline+="%*"

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_mode_map = {'mode':'passive'}
" let g:syntastic_loc_list_height = 5
" let g:syntastic_python_checkers = ['pylint', 'flake8', 'python']
" let g:syntastic_python_pylint_args = '-E'
" let g:syntastic_python_flake8_args = '--config=/Users/mreinhardt/dev/riot/dss/config-linters/flake8'
" let g:syntastic_python_python_exec = 'python3'

" vim-gh-line
let g:gh_line_map = '<leader>ghl'

" coc
      " \ 'coc-go',
let g:coc_global_extensions = [
      \ 'coc-pyright',
      \ 'coc-tsserver',
      \ 'coc-yaml'
      \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <Leader>ec :split ~/.config/nvim/coc-settings.json<CR>
nnoremap <silent> [e <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]e <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>im <Plug>(coc-autoimport)

" Quickfix navigation
nnoremap <Leader>ff :.cc<CR>

" lsp
lua require("lsp_config")
" autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
" autocmd BufWritePre *.go lua goimports(1000)

" copilot
nnoremap <Leader>c :Copilot<CR>
nnoremap <Leader>c< :CopilotPrev<CR>
nnoremap <Leader>c> :CopilotNext<CR>
nnoremap <Leader>ca :CopilotAdd<CR>
nnoremap <Leader>cb :CopilotBackup<CR>
nnoremap <Leader>cc :CopilotCopy<CR>
nnoremap <Leader>cd :CopilotDelete<CR>
nnoremap <Leader>cf :CopilotFind<CR>
nnoremap <Leader>cg :CopilotGrep<CR>
nnoremap <Leader>ch :CopilotHelp<CR>
nnoremap <Leader>ci :CopilotInsert<CR>
nnoremap <Leader>ck :CopilotKill<CR>
nnoremap <Leader>cl :CopilotList<CR>
nnoremap <Leader>cm :CopilotMove<CR>
nnoremap <Leader>co :CopilotOpen<CR>
nnoremap <Leader>cp :CopilotPreview<CR>
nnoremap <Leader>cq :CopilotClose<CR>
nnoremap <Leader>cr :CopilotReplace<CR>
nnoremap <Leader>cs :CopilotSearch<CR>
nnoremap <Leader>ct :CopilotToggle<CR>
nnoremap <Leader>cu :CopilotUndo<CR>
nnoremap <Leader>cv :CopilotPaste<CR>
nnoremap <Leader>cx :CopilotClear<CR>
nnoremap <Leader>cy :CopilotYank<CR>
nnoremap <Leader>cz :CopilotZoom<CR>
nnoremap <Leader>c: :Copilot panel<CR>

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

" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_metalinter_command = 'golangci-lint'
" Example set linters enabled if no .golangci.yml specified:
" let g:go_metalinter_enabled = [
"       \ 'bodyclose',
"       \ 'dogsled',
"       \ 'dupl',
"       \ 'exhaustruct',
"       \ 'errcheck',
"       \ 'copyloopvar',
"       \ 'funlen',
"       \ 'gci',
"       \ 'goconst',
"       \ 'gocritic',
"       \ 'gocyclo',
"       \ 'gofmt',
"       \ 'goimports',
"       \ 'goprintffuncname',
"       \ 'gosec',
"       \ 'gosimple',
"       \ 'govet',
"       \ 'ineffassign',
"       \ 'lll',
"       \ 'misspell',
"       \ 'mnd',
"       \ 'nakedret',
"       \ 'noctx',
"       \ 'nolintlint',
"       \ 'revive',
"       \ 'staticcheck',
"       \ 'stylecheck',
"       \ 'typecheck',
"       \ 'unconvert',
"       \ 'unparam',
"       \ 'unused',
"       \ 'whitespace' ]
nnoremap <Leader>gl :GoMetaLinter<CR>

" vim-markdown
set conceallevel=0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
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

" CopilotChat
lua << EOF
require("CopilotChat").setup {

  -- Shared config starts here (can be passed to functions at runtime and configured via setup function)

  system_prompt = 'COPILOT_INSTRUCTIONS', -- System prompt to use (can be specified manually in prompt via /).

  model = 'gpt-4o', -- Default model to use, see ':CopilotChatModels' for available models (can be specified manually in prompt via $).
  agent = 'copilot', -- Default agent to use, see ':CopilotChatAgents' for available agents (can be specified manually in prompt via @).
  context = nil, -- Default context or array of contexts to use (can be specified manually in prompt via #).
  sticky = nil, -- Default sticky prompt or array of sticky prompts to use at start of every new chat.

  temperature = 0.1, -- GPT result temperature
  headless = false, -- Do not write to chat buffer and use history (useful for using custom processing)
  stream = nil, -- Function called when receiving stream updates (returned string is appended to the chat buffer)
  callback = nil, -- Function called when full response is received (retuned string is stored to history)
  remember_as_sticky = true, -- Remember model/agent/context as sticky prompts when asking questions

  -- default selection
  -- see select.lua for implementation
  -- selection = function(source)
  --   return select.visual(source) or select.buffer(source)
  -- end,

  -- default window options
  window = {
    layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
    width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
    height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
    -- Options below only apply to floating windows
    relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
    border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
    row = nil, -- row position of the window, default is centered
    col = nil, -- column position of the window, default is centered
    title = 'Copilot Chat', -- title of chat window
    footer = nil, -- footer of chat window
    zindex = 1, -- determines if window is on top or below other floating windows
  },

  show_help = true, -- Shows help message as virtual lines when waiting for user input
  highlight_selection = true, -- Highlight selection
  highlight_headers = true, -- Highlight headers in chat, disable if using markdown renderers (like render-markdown.nvim)
  references_display = 'virtual', -- 'virtual', 'write', Display references in chat as virtual text or write to buffer
  auto_follow_cursor = true, -- Auto-follow cursor in chat
  auto_insert_mode = false, -- Automatically enter insert mode when opening window and on new prompt
  insert_at_end = false, -- Move cursor to end of buffer when inserting text
  clear_chat_on_new_prompt = false, -- Clears chat on every new prompt

  -- Static config starts here (can be configured only via setup function)

  debug = false, -- Enable debug logging (same as 'log_level = 'debug')
  log_level = 'info', -- Log level to use, 'trace', 'debug', 'info', 'warn', 'error', 'fatal'
  proxy = nil, -- [protocol://]host[:port] Use this proxy
  allow_insecure = false, -- Allow insecure server connections

  chat_autocomplete = true, -- Enable chat autocompletion (when disabled, requires manual `mappings.complete` trigger)

  log_path = vim.fn.stdpath('state') .. '/CopilotChat.log', -- Default path to log file
  history_path = vim.fn.stdpath('data') .. '/copilotchat_history', -- Default path to stored history

  question_header = '# User ', -- Header to use for user questions
  answer_header = '# Copilot ', -- Header to use for AI answers
  error_header = '# Error ', -- Header to use for errors
  separator = '───', -- Separator to use in chat

  -- default providers
  -- see config/providers.lua for implementation
  providers = {
    copilot = {
    },
    github_models = {
    },
    copilot_embeddings = {
    },
  },

  -- default contexts
  -- see config/contexts.lua for implementation
  contexts = {
    buffer = {
    },
    buffers = {
    },
    file = {
    },
    files = {
    },
    git = {
    },
    url = {
    },
    register = {
    },
    quickfix = {
    },
    system = {
    }
  },

  -- default prompts
  -- see config/prompts.lua for implementation
  prompts = {
    Explain = {
      prompt = 'Write an explanation for the selected code as paragraphs of text.',
      system_prompt = 'COPILOT_EXPLAIN',
    },
    Review = {
      prompt = 'Review the selected code.',
      system_prompt = 'COPILOT_REVIEW',
    },
    Fix = {
      prompt = 'There is a problem in this code. Identify the issues and rewrite the code with fixes. Explain what was wrong and how your changes address the problems.',
    },
    Optimize = {
      prompt = 'Optimize the selected code to improve performance and readability. Explain your optimization strategy and the benefits of your changes.',
    },
    Docs = {
      prompt = 'Please add documentation comments to the selected code.',
    },
    Tests = {
      prompt = 'Please generate tests for my code.',
    },
    Commit = {
      prompt = 'Write commit message for the change with commitizen convention. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block.',
      context = 'git:staged',
    },
  },

  -- default mappings
  -- see config/mappings.lua for implementation
  mappings = {
    complete = {
      insert = '<Tab>',
    },
    close = {
      normal = 'q',
      insert = '<C-c>',
    },
    reset = {
      normal = '<C-l>',
      insert = '<C-l>',
    },
    submit_prompt = {
      normal = '<CR>',
      insert = '<C-s>',
    },
    toggle_sticky = {
      normal = 'grr',
    },
    clear_stickies = {
      normal = 'grx',
    },
    accept_diff = {
      normal = '<C-y>',
      insert = '<C-y>',
    },
    jump_to_diff = {
      normal = 'gj',
    },
    quickfix_answers = {
      normal = 'gqa',
    },
    quickfix_diffs = {
      normal = 'gqd',
    },
    yank_diff = {
      normal = 'gy',
      register = '"', -- Default register to use for yanking
    },
    show_diff = {
      normal = 'gd',
      full_diff = false, -- Show full diff instead of unified diff when showing diff window
    },
    show_info = {
      normal = 'gi',
    },
    show_context = {
      normal = 'gc',
    },
    show_help = {
      normal = 'gh',
    },
  },
}
EOF
