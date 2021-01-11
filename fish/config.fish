# Symlink this file to ~/.config/fish/config.fish
set -gx PATH $PATH $HOME/dev/go/bin $HOME/.cargo/bin
set -gx GOPATH $HOME/dev/go
set -gx EDITOR nvim

alias ls="exa -lgHS --git --time-style long-iso --extended"
alias cat="bat --theme gruvbox"
alias grep="rg"
