#!/bin/bash

ls | while read -r file_name;
do
    ytdl_code="$( echo "$file_name" | rev | cut -d'-' -f 1 | rev | cut -d'.' -f 1 )"
    new_file_name="${file_name//-$ytdl_code}"
    mv "$file_name" "$new_file_name"
done
