call neomake#configure#automake('nw', 750)



" automatically run linter and open errorlist
let g:neomake_open_list = 2
let g:neomake_list_height = 8

" modify gutter symbols
let g:neomake_error_sign = {
          \ 'text': '×',
          \ 'texthl': 'NeomakeErrorSign',
          \ }
let g:neomake_warning_sign = {
          \ 'text': '⚑',
          \ 'texthl': 'NeomakeWarningSign',
          \ }
let g:neomake_message_sign = {
          \ 'text': '⊢',
          \ 'texthl': 'NeomakeMessageSign',
          \ }
let g:neomake_info_sign = {
          \ 'text': '※',
          \ 'texthl': 'NeomakeInfoSign',
          \ }

" automatically close the location list
augroup my_neomake_qf
    autocmd!
    autocmd QuitPre * if &filetype !=# 'qf' | lclose | endif
augroup END
