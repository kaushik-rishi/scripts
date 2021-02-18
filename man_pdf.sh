#!/bin/bash

# TODO: Check if no man page exists. 
# In that case send a notification to the user
# saying that "No manual entry for ...."

command_chosen="$(dmenu_path | dmenu)"

if [ -z "$command_chosen" ]; then
    echo "Please select any one of the options"
else
    man -Tpdf "$command_chosen" | zathura - & disown
fi
