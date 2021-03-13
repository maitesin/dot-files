#!/usr/bin/env bash

set -e

# Link configuration folders
ln -s ~/.dot-files/alacritty ~/.config/alacritty
ln -s ~/.dot-files/fish ~/.config/fish
ln -s ~/.dot-files/nvim ~/.config/nvim
ln -s ~/.dot-files/buku ~/.local/share/buku
ln -s ~/.dot-files/liferea/config ~/.config/liferea
ln -s ~/.dot-files/liferea/local_shared ~/.local/share/liferea
ln -s ~/.dot-files/git/.gitconfig ~/.gitconfig
ln -s ~/.dot-files/git/.gitignore_global ~/.gitignore_global
ln -s ~/.dot-files/notable/.notable.json ~/.notable.json
ln -s ~/.dot-files/notable/config ~/.config/notable
mkdir -p ~/.pandoc/templates
ln -s ~/.dot-files/pandoc/eisvogel.latex ~/.pandoc/templates

# Hiden the snap folder from the home directory
echo "snap" >> ~/.hidden

# Install snaps
sudo snap install --classic go
sudo snap install --classic goland
sudo snap install --classic code
sudo snap install --classic slack
sudo snap install --classic skype
sudo snap install --classic notable
sudo snap install --classic kubectl
sudo snap install --classic ripgrep

sudo snap install --edge keybase

sudo snap install \
	discord \
	telegram-desktop \
	postman \
	zoom-client \
	signal-desktop \
	hugo \
	htop \
	dbeaver-ce \
	nmap

# Install apt packages
sudo apt update
sudo apt install -y \
	build-essential \
	ctags \
	clang \
	neovim \
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
  mdp

# Download vim-plug to manage NeoVim's plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Change default shell
chsh -s $(which fish) $USER

# Install Google Chrome
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable_current_amd64.deb
# sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb

# Add user to docker
sudo usermod -aG docker $USER

# Install Rust Toolchain
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install alacritty dependencies
sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3

# Install Rust binaries
~/.cargo/bin/cargo install alacritty git-delta bat exa fd-find

# Download Alacritty's desktop file
curl https://raw.githubusercontent.com/alacritty/alacritty/master/extra/linux/Alacritty.desktop -o ~/.local/share/applications/Alacritty.desktop

# Download Alacritty's fish completion
curl https://raw.githubusercontent.com/alacritty/alacritty/master/extra/completions/alacritty.fish -o ~/.config/fish/completions/alacritty.fish

# Download Alacritty's icon
curl https://raw.githubusercontent.com/alacritty/alacritty/master/extra/logo/alacritty-simple.svg -o /tmp/Alacritty.svg
sudo mv /tmp/Alacritty.svg /usr/share/pixmaps/

# Install Oh-My-Fish
curl -L https://get.oh-my.fish | fish

# All done. Time to restart
echo "Time to restart the computer"

