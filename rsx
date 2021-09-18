#!/bin/bash

status_code="$(pgrep -u root,darkangel '^sxhkd$')"

if [ -z "$status_code" ]; then
    echo "Not started yet"
    echo "Starting SXHKD"
else
    kill "$status_code" && echo "Killed SXHKD"
fi

sxhkd & disown
echo "Restarted SXHKD"
