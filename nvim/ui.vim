" airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

filetype plugin indent on

" NERDTree configuration
" autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

colorscheme gruvbox
let g:airline_theme='gruvbox'

