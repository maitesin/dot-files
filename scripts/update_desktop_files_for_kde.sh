#!/usr/bin/env bash

DST=/usr/share/applications/
SRC=/var/lib/snapd/desktop/applications/

pushd ${SRC} || exit

for f in $(ls *.desktop)
do
  ln -s "${SRC}${f}" "${DST}${f}"
done

