#!/usr/bin/env bash

# USES PULSE ONLY, you might need to check and set the recording device in pavucontrol
# see https://qubodup.wordpress.com/2012/01/03/this-is-how-i-record-my-screen-on-linux/

# echo "Click a window to record it"

# xwininfo is being used to get target window position and geometry
WININFO="$(xwininfo)"
GEOMETRY="$(echo $WININFO | grep geometry)"
CORNERS="$(echo $WININFO | grep Corners:)"
DIM="$(echo $GEOMETRY | sed -e 's/^.*y //' | sed -e 's/+.*$//')"
XPOS="$(echo $CORNERS | sed -e 's/^[^+]*+//;s/+.*$//')"
YPOS="$(echo $CORNERS | sed -e 's/^[^+]*+[^+]*+//;s/ .*$//')"

if [[ $1 != "" ]]; then
	NAME="$1"
else
  NAME="$(date +%Y%m%d@%H%M%S)"
fi

# do not set `-r 30` to avoid audio desynchronization. This comes at the cost of lagging being recorded.
ffmpeg -f alsa -sample_rate 44100 -i pulse -f x11grab -acodec pcm_s16le -s $DIM -i :0.0+$XPOS,$YPOS -vcodec libx264 -crf 0 -preset ultrafast -threads 0 myobs-$NAME.mkv
