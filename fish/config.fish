# Symlink this file to ~/.config/fish/config.fish
set -gx GOPATH $HOME/dev/go
set -gx PATH $PATH $GOPATH/bin $HOME/.cargo/bin
set -gx EDITOR nvim
set -gx TINYGO $HOME/dev/tinygo
set -gx PATH $PATH $TINYGO/bin

alias ls="eza -lgHSI snap --git --time-style long-iso"
alias cat="bat --theme gruvbox-dark"
alias grep="rg"

if test -f $HOME/.local.fish
  source $HOME/.local.fish
end

