" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" in normal mode Shift + F2 strip the whitespace of the file and save it
nmap <S-F2> :StripWhitespace :w<CR>
" in insert mode Shift + F2 strip the whitespace of the file and save it
nmap <S-F2> <ESC> :StripWhitespace :w<CR>i
" in normal mode F3 will strip the whitespaces of the file
nmap <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>i
" switch between header/source with F4
autocmd BufNewFile,BufRead *cpp map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
autocmd BufNewFile,BufRead *.c map <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
" recreate tags file with F5
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" build using makeprg with <F6>
map <F6> :make<CR>
" build using makeprg with <S-F6>
map <S-F6> :make clean all<CR>
" GDB: step into (Step)
imap <F7> s<CR>
" GDB: step over (Next)
imap <F8> n<CR>
" FixIt
map <F9> :YcmCompleter FixIt<CR>
imap <F9>  <ESC>:YcmCompleter FixIt<CR>i
" goto definition with F12
map <F12> <C-]>

"clang-format integration
" Ubuntu
map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format.py<cr>
" Arch
"map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
"imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>

" Ctrl + c comment selected lines
map <C-c> :s/^/\/\//<Enter>
" Ctrl + u uncomment selected lines
map <C-u> :s/^\/\///<Enter>


