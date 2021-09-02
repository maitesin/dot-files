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
map <C-m> :Vista!! <CR>

" Commentary
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

" Completion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
