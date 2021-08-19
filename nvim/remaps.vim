" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" in normal mode F3 will strip the whitespaces of the file
nmap <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>i
" recreate tags file with F5
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" build using makeprg with <F6>
map <F6> :make<CR>
" build using makeprg with <S-F6>
map <S-F6> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>

" Ctrl + c comment selected lines
map <C-c> :s/^/\/\//<Enter>
" Ctrl + u uncomment selected lines
map <C-u> :s/^\/\///<Enter>

" fzf remaps to search files
map <C-p> :Files<CR>
imap <C-p> :Files<CR>i

" Vista
map <C-m> :Vista <CR>

" Telescope
if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF

