#!/bin/bash

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
	shellcheck

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
~/.cargo/bin/cargo install alacritty git-delta bat exa

# Install Oh-My-Fish
curl -L https://get.oh-my.fish | fish

# All done. Time to restart
echo "Time to restart the computer"

