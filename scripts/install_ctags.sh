#!/usr/bin/env bash

DIR=$(mktemp -d)

git clone https://github.com/universal-ctags/ctags.git ${DIR}
cd ${DIR}
./autogen.sh
./configure
make
sudo make install
