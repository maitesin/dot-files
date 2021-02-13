#!/usr/bin/env bash

set -e

sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev

sudo apt install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3 libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev

# Download the latest version of the polybar (check if a newest version is available)
folder=$(mktemp -d)
pushd "${folder}" || exit

wget https://github.com/polybar/polybar/releases/download/3.5.4/polybar-3.5.4.tar.gz

tar vxzf polybar* && rm polybar*.tar.gz

cd polybar*

mkdir build && cd build && cmake .. && make && sudo make install
