#!/bin/bash

QUICK_LOCATION="$HOME/.frequent"
FILE_NAME="$( ls $QUICK_LOCATION  | dmenu)"

[ ! -z FILE_NAME ] && xdg-open "$QUICK_LOCATION/$FILE_NAME"
