
nnoremap <leader>n  :NvimTreeToggle<CR>
" Shortcutting split navigation, saving a keypress:
	nmap <leader>w <C-w>

" Spell-check set to <leader>o, 'o' for 'orthography':
	nmap <leader>o :setlocal spell! spelllang=en_us<CR>

" Telescope
" Find files using Telescope command-line sugar.

nnoremap <leader>ff <cmd>Telescope find_files <cr>
nnoremap <leader>fg <cmd>Telescope live_grep  <cr>
nnoremap <leader>fb <cmd>Telescope buffers    <cr>
nnoremap <leader>fh <cmd>Telescope help_tags  <cr>

" bufferline magical stuff

" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent><leader>] :BufferLineCycleNext<CR>
nnoremap <silent><leader>[ :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><leader>b] :BufferLineMoveNext<CR>
nnoremap <silent><leader>b[ :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent><leader>be :BufferLineSortByExtension<CR>
nnoremap <silent><leader>bd :BufferLineSortByDirectory<CR>
nnoremap <silent><leader>bc :bd<CR>
