#!/usr/bin/env bash

export ARCH="arm64"
export CC="/usr/bin/gcc"
export KERL_CONFIGURE_OPTIONS="--with-ssl=/usr/local/opt/openssl@1.1 \
  --with-wx-config=/usr/local/opt/wxwidgets/bin/wx-config \
  --without-javac \
  --disable-jit"

asdf install erlang 24.0.5
