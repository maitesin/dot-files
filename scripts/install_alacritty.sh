#!/usr/bin/env bash

set -e

# Install Rust binaries
~/.cargo/bin/cargo install alacritty

# Download Alacritty's desktop file
curl https://raw.githubusercontent.com/alacritty/alacritty/master/extra/linux/Alacritty.desktop -o ~/.local/share/applications/Alacritty.desktop

# Download Alacritty's fish completion
curl https://raw.githubusercontent.com/alacritty/alacritty/master/extra/completions/alacritty.fish -o ~/.config/fish/completions/alacritty.fish

# Download Alacritty's icon
curl https://raw.githubusercontent.com/alacritty/alacritty/master/extra/logo/alacritty-simple.svg -o /tmp/Alacritty.svg
sudo mv /tmp/Alacritty.svg /usr/share/pixmaps/


