nnoremap <Leader>fn i(fn [] nil)<ESC>F]i
nnoremap <Leader>df i(def _ nil)<ESC>F_ciw
nnoremap <Leader>dn i(defn _<CR>""<CR>[]<CR>nil)<ESC>kkk^f_ciw

nnoremap <Leader>rt :VimuxRunCommand("lein test")<CR>

set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
