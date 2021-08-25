" Vim Bundles (Vim-Plug)
call plug#begin('~/.local/share/nvim/plugged')

" Commentary
Plug 'tpope/vim-commentary'

" NERDTree
Plug 'preservim/nerdtree' |
\ Plug 'Xuyuanp/nerdtree-git-plugin'

" Removes trailing whitespaces on save
Plug 'ntpeters/vim-better-whitespace'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Multi cursor
Plug 'terryma/vim-multiple-cursors'

" Vim surround manager
Plug 'tpope/vim-surround'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color theme
Plug 'gruvbox-community/gruvbox'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/completion-nvim'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Tags
Plug 'liuchengxu/vista.vim'

call plug#end()
