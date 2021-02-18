#!/bin/bash

selection="$( fzf )"

if [ -z "$selection" ]; then
    echo "Please select some file to open"
else
    xdg-open "$selection" > /dev/null 2>&1
fi


