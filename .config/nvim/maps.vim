" nvim tree
nnoremap <leader>n  :Vex<CR>

" Shortcutting split navigation, saving a keypress:
nmap <leader>w <C-w>

" Spell-check set to <leader>o, 'o' for 'orthography':
nmap <leader>o :setlocal spell! spelllang=en_us<CR>

" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files <cr>
nnoremap <leader>fb <cmd>Telescope buffers <cr>
nnoremap <leader>f/ <cmd>Telescope current_buffer_fuzzy_find    <cr>
nnoremap <leader>fh <cmd>Telescope help_tags  <cr>
nnoremap <leader>ft <cmd>Telescope tags  <cr>
nnoremap <leader>fd <cmd>Telescope grep_string  <cr>
nnoremap <leader>fg <cmd>Telescope live_grep  <cr>
nnoremap <leader>fo <cmd>Telescope oldfiles  <cr>
nnoremap <leader>fr <cmd>Telescope file_browser  <cr>

nnoremap <leader>fs <cmd>Telescope lsp_document_symbols <cr>
nnoremap <leader>fw <cmd>Telescope lsp_workspace_symbols <cr>

nnoremap <leader>gb <cmd>Telescope git_branches <cr>
nnoremap <leader>gf <cmd>Telescope git_files <cr>
nnoremap <leader>gt <cmd>Telescope git_stash <cr>
nnoremap <leader>gs <cmd>Telescope git_status <cr>
nnoremap <leader>gc <cmd>Telescope git_commits <cr>

" bufferline magical stuff

" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <leader>] :bn<CR>
nnoremap <leader>[ :bp<CR>
nnoremap <leader><leader> <C-^>

" These commands will move the current buffer backwards or forwards in the bufferline

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent><leader>bd :bd<CR>

" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Lsp
nnoremap <leader>lq :LspRestart<CR>


