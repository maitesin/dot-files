#!/usr/bin/env bash

set -e

# Link configuration folders
ln -s ~/.dot-files/i3 ~/.config/i3
ln -s ~/.dot-files/polybar ~/.config/polybar

# Install apt packages
sudo apt install -y \
  i3 \
  fonts-font-awesome

# Call polybar instalation
./install_polybar.sh


