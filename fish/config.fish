# Symlink this file to ~/.config/fish/config.fish
set -gx GOPATH $HOME/dev/go
set -gx PATH $PATH $GOPATH/bin $HOME/.cargo/bin
set -gx EDITOR nvim
set -gx GOPRIVATE github.com/sketch-hq

alias ls="exa -lgHSI snap --git --time-style long-iso"
alias cat="bat --theme gruvbox"
alias grep="rg"

if test -f /usr/local/opt/asdf/asdf.fish
  source /usr/local/opt/asdf/asdf.fish
end

if test -f $HOME/.local.fish
  source $HOME/.local.fish
end

if test -d /Applications/Sketch.app/Contents/MacOS
  set -gx PATH $PATH /Applications/Sketch.app/Contents/MacOS
end
