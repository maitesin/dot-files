" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F1> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F1> <ESC>:w<CR>i
" in normal mode F3 will strip the whitespaces of the file
nmap <F2> :NERDTreeToggle<CR>
imap <F2> <ESC>:NERDTreeToggle<CR>i
"
" fzf remaps to search files
map <C-p> :Files<CR>
imap <C-p> :Files<CR>i
" fxf remaps to search inside files
map <C-o> :Rg<CR>
imap <C-o> :Rg<CR>i

" Vista
map <C-m> :Vista <CR>

" Commentary
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>
