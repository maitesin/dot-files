#!/bin/bash

volume=$(pactl list sinks | grep -B1 '^[[:space:]]Volume:' | tail -n 5 | head -n 2 | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
muted=$(pactl list sinks | grep -B1 '^[[:space:]]Volume:' | tail -n 5 | head -n 1 | awk '{print $2}')

if [[ "$muted" == "yes" ]]
then
  echo 'Mute'
else
  echo $volume
fi
