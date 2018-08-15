nnoremap [denite] <nop>
nmap <C-s> [denite]
nnoremap <silent> [denite]f :Denite -reversed file_rec<cr>
nnoremap <silent> [denite]r :Denite -reversed file_mru<cr>
nnoremap <silent> [denite]b :Denite -reversed buffer<cr>
nnoremap <silent> [denite]l :Denite -reversed line<cr>
nnoremap <silent> [denite]e :Denite -reversed grep<cr>
nnoremap <silent> [denite]y :Denite -reversed neoyank<cr>
nnoremap <silent> [denite]h :Denite -reversed help<cr>
nnoremap <silent> [denite]gs :Denite -reversed gitstatus<cr>
nnoremap <silent> [denite]gl :Denite -reversed gitlog<cr>
nnoremap <silent> [denite]gc :Denite -reversed gitchanged<cr>

" Change mappings
call denite#custom#map('insert',
      \ '<Down>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<Up>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)
call denite#custom#map('insert',
      \ '<C-Down>',
      \ '<denite:assign_next_text>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-Up>',
      \ '<denite:assign_previous_text>',
      \ 'noremap'
      \)

call denite#custom#var(
      \ 'file_rec',
      \ 'command',
      \ ['rg', '--files', '--hidden', '--glob', '!.git'])

" change matchers
call denite#custom#source(
      \ 'file_rec',
      \ 'matchers',
      \ ['matcher_fuzzy'])

" change sorters
call denite#custom#source(
      \ 'file_rec',
      \ 'sorters',
      \ ['sorter_sublime'])

call denite#custom#var('grep',
      \ 'command', ['rg'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'default_opts',
    \ ['--vimgrep', '--no-heading'])

call denite#custom#option('default', 'prompt', '>')
