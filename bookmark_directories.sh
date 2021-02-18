#!/bin/bash

# cat $HOME/.content-files/.bmdirs | awk '{print $1}' | dmenu

declare -A pathMap

while read -r line
do
    key="$(echo "$line" | awk '{print $1}')"
    value="$(echo "$line" | awk '{print $2}')"

    pathMap[$key]=$value
done < "$HOME/.content-files/.bmdirs"


keys_list=${!pathMap[@]}

selected_folder="$( echo "$keys_list" | tr ' ' '\n' | dmenu )"

selected_folder_path="${pathMap["$selected_folder"]}"
echo "$selected_folder_path"

selected_application="$( echo 'terminal thunar' | tr ' ' '\n' | dmenu )"

if [ "$selected_application" = "terminal" ]; then
    xfce4-terminal --working-directory="$selected_folder_path"
else
    thunar $selected_folder_path
fi


