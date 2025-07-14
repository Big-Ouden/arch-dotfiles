#!/usr/bin/env bash

if (ps aux | grep mpv | grep -v grep > /dev/null); then
    pkill mpv
else
    runbg.sh mpv --no-video ~/.config/custom-scripts/lofi.mp3
fi
