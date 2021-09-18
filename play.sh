#!/bin/bash

# ----------------------------------------------- #
#   Play the video link in the top of clipboard   #
# ----------------------------------------------- #

url="$(xclip -o)"
notify-send -t 2 "Ready to play: $url"
mpv "$url"
