" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
autocmd BufNewFile,BufRead *.cpp set tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.c   set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
autocmd BufNewFile,BufRead *.cpp set colorcolumn=120 textwidth=120
autocmd BufNewFile,BufRead *.c   set colorcolumn=80  textwidth=80
" highlight ColorColumn ctermbg=darkgrey
" turn syntax highlighting on
set t_Co=256
set background=dark
syntax on
" colorscheme wombat256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" folding methods
set foldmethod=marker
set foldmarker={,}
set foldlevel=0
set foldclose=all

" set visual bell instead of beeping. Moreover set vim not to beep nor flash
set visualbell
set t_vb=

" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" in normal mode F3 will strip the whitespaces of the file
nmap <F3> :StripWhitespace<CR>
" in insert mode F3 will exit insert, strip the whitespaces, enters insert again
imap <F3> <ESC>:StripWhitespace<CR>i
" switch between header/source with F4
autocmd BufNewFile,BufRead *cpp map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
autocmd BufNewFile,BufRead *.c map <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>

"clang-format integration
map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format.py<cr>

" Setting YouCompleteMe global extra configuration
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme = 'molokai'


" Vim Bundles (Vundle)
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'vim-scripts/Conque-GDB'
Bundle 'oplatek/Conque-Shell'
Bundle 'ntpeters/vim-better-whitespace'

Plugin 'NLKNguyen/papercolor-theme'

filetype plugin indent on
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" NERDTree configuration
" autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

colorscheme PaperColor
