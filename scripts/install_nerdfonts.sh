#!/usr/bin/env bash

mkdir ~/.fonts

wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Hack.zip" -O /tmp/Hack.zip

unzip /tmp/Hack.zip -d ~/.fonts

fc-cache -fv
