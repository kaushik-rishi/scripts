#/bin/bash

declare -A path_map

while read -r expansion;
do
    key="${expansion%% =*}"
    value="${expansion##* = }"
done < /home/darkangel/.content-files/.bmdirs



