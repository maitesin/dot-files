# Symlink this file to ~/.config/fish/config.fish
set -gx GOPATH $HOME/dev/go
set -gx FLYCTL_INSTALL $HOME/.fly
set -gx PATH $PATH $GOPATH/bin $HOME/.cargo/bin $FLYCTL_INSTALL/bin
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
  alias sketchtool="/Applications/Sketch.app/Contents/MacOS/sketchtool"
end

if test -d /Applications/Sketch\ Experimental.app/Contents/MacOS/
  alias sketchtool-experimental="/Applications/Sketch\ Experimental.app/Contents/MacOS/sketchtool"
end
