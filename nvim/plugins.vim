" Vim Bundles (Vim-Plug)
call plug#begin('~/.local/share/nvim/plugged')

Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ntpeters/vim-better-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf.vim'

Plug 'neomake/neomake'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color theme
Plug 'gruvbox-community/gruvbox'

" GraphQL
Plug 'jparise/vim-graphql'

call plug#end()
