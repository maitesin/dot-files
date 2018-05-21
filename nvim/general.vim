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
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab        " expand tabs to spaces
" wrap lines at 80 chars
" set colorcolumn=80
" set textwidth=80
" turn line numbers on
set relativenumber number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" set visual bell instead of beeping. Moreover set vim not to beep nor flash
set visualbell
set t_vb=
" turn syntax highlighting on
set t_Co=256
set background=dark
syntax on
" folding methods
set foldmethod=marker
set foldmarker={,}
set foldlevel=0
set foldclose=all

