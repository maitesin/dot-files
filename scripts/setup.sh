#!/usr/bin/env bash

set -e

# Link configuration folders
ln -s ~/.dot-files/alacritty ~/.config/alacritty
ln -s ~/.dot-files/fish ~/.config/fish
ln -s ~/.dot-files/nvim ~/.config/nvim
ln -s ~/.dot-files/vimwiki ~/vimwiki
ln -s ~/.dot-files/beets ~/.config/beets
ln -s ~/.dot-files/buku ~/.local/share/buku
ln -s ~/.dot-files/liferea/config ~/.config/liferea
ln -s ~/.dot-files/liferea/local_shared ~/.local/share/liferea
ln -s ~/.dot-files/nap ~/.local/share/nap
ln -s ~/.dot-files/git/.gitconfig ~/.gitconfig
ln -s ~/.dot-files/git/.gitignore_global ~/.gitignore_global
ln -s ~/.dot-files/notable/.notable.json ~/.notable.json
ln -s ~/.dot-files/notable/config ~/.config/notable
mkdir -p ~/.pandoc/templates
ln -s ~/.dot-files/pandoc/eisvogel.latex ~/.pandoc/templates
ln -s ~/.dot-files/pandoc/letter.latex ~/.pandoc/templates

# Hiden the snap folder from the home directory
echo "snap" >> ~/.hidden

# Install snaps
sudo snap install --classic go
sudo snap install --classic goland
sudo snap install --classic --edge nvim

sudo snap install \
	discord \
	telegram-desktop \
	signal-desktop \
	hugo \
	htop \
	nmap \
  slack \
  cacher

# Install apt packages
sudo apt update
sudo apt install -y \
	build-essential \
	exuberant-ctags \
	clang \
	git \
	openssh-server \
	fish \
	python3 \
	python3-pip \
	jq \
	curl \
	docker.io \
	docker-compose \
	shellcheck \
	buku \
	liferea \
	fonts-powerline \
	fonts-hack-ttf \
  clipit \
  mdp \
  tmux

# Change default shell
chsh -s $(which fish) $USER

# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable_current_amd64.deb
sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb

#Install NerdFonts
./install_nerdfonts.sh

# Add user to docker
sudo usermod -aG docker $USER

# Install Rust Toolchain
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install alacritty dependencies
sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

# Install Rust binaries
~/.cargo/bin/cargo install git-delta bat exa ripgrep alacritty fd-find

# Install Alacritty
#./install_alacritty.sh

# Install tree-sitter from cargo
~/.cargo/bin/cargo install tree-sitter-cli --git https://github.com/tree-sitter/tree-sitter.git --tag v0.20.7

# Install universal-ctags (https://github.com/universal-ctags/ctags)
# ./install_ctags.sh

# Install Oh-My-Fish
curl -L https://get.oh-my.fish | fish

# All done. Time to restart
echo "Time to restart the computer"

