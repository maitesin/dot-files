" Vim Bundles (Vim-Plug)
call plug#begin('~/.local/share/nvim/plugged')

Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ntpeters/vim-better-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

" NeoMake
Plug 'neomake/neomake'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color theme
Plug 'gruvbox-community/gruvbox'

" GraphQL
Plug 'jparise/vim-graphql'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()
