# Symlink this file to ~/.config/fish/config.fish
set -gx PATH $PATH $HOME/dev/go/bin $HOME/.cargo/bin
set -gx GOPATH $HOME/dev/go
set -gx EDITOR nvim

alias ls="exa"
alias cat="bat"
