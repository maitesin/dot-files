" Vim Bundles (Vim-Plug)
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'neomake/neomake'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color theme
Plug 'NLKNguyen/papercolor-theme'

" GraphQL
Plug 'jparise/vim-graphql'

call plug#end()


let g:go_version_warning = 0
