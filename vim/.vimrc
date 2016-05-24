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
set relativenumber number
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
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" GDB: step into (Step)
imap <F8> s<CR>
" GDB: step over (Next)
imap <F9> n<CR>
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

" Setting YouCompleteMe global extra configuration
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Vim Bundles (Vundle)
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'vim-scripts/Conque-GDB'
Bundle 'oplatek/Conque-Shell'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'jiangmiao/auto-pairs'

" Stuff for the snippets
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle 'honza/vim-snippets'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Color theme
Plugin 'NLKNguyen/papercolor-theme'

filetype plugin indent on

" NERDTree configuration
" autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Change stuff from YCM and snippets to work together
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

colorscheme PaperColor
