#!/bin/bash

# ------------------------------------------------------------------------------------------------------------- #
#           Displays a dmenu prompt of .bash_history and Allows me to map the selection to my clipboard         #
# ------------------------------------------------------------------------------------------------------------- #

# BUG: History command not working in bash scripts
# history | awk '{$1=""; print $0}' | awk '{$1=$1; print}' | dmenu


selected_command=$(dmenu < ~/.bash_history)
copyq copy "$selected_command" > /dev/null


