" airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

filetype plugin indent on

" better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

colorscheme gruvbox
let g:airline_theme='gruvbox'

lua << EOF

-- git integration
require('gitsigns').setup()

EOF
