" Vim Bundles (Vundle)
call plug#begin('~/.local/share/nvim/plugged')

function! BuildYCM(info)
  let os_name = system("uname")
  if a:info.status == 'installed' || a:info.force
    if os_name == 'OpenBSD'
      !./install.py --clang-completer --gocode-completer --rust-completer --system-libclang
    else
      !./install.py --clang-completer --gocode-completer --rust-completer
    endif
  endif
endfunction

Plug 'Valloric/YouCompleteMe', {'for':['c', 'cpp', 'python', 'go', 'rust'], 'do': function('BuildYCM')}
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/Conque-GDB'
Plug 'oplatek/Conque-Shell'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'

" Stuff for the snippets
Plug 'honza/vim-snippets'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color theme
Plug 'NLKNguyen/papercolor-theme'

" Rust
Plug 'rust-lang/rust.vim'

" Golang
Plug 'fatih/vim-go'

call plug#end()


