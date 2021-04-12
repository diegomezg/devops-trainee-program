#!/bin/bash

echo -n "Git Folder: "
read folder

if [ ! -d $folder ]; then
    echo "$folder is not a folder. Creating new folder..."
    mkdir -p $folder
fi

echo "Running git init..."
cd "$folder"
git init

ls .git/ > $folder/git_content.txt
echo "Thanks" > $folder/mensaje.txt
