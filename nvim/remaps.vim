" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F1> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F1> <ESC>:w<CR>i
" in normal mode F3 will strip the whitespaces of the file
nmap <F2> :NvimTreeToggle<CR>
imap <F2> <ESC>:NvimTreeToggle<CR>i
"
" fzf remaps to search files
map <C-p> :Files<CR>
imap <C-p> :Files<CR>i
" fxf remaps to search inside files
map <C-o> :Rg<CR>
imap <C-o> :Rg<CR>i

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

