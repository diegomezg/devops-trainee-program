#!/bin/bash

echo -n "Folder: "
read folder

if [ ! -d $folder ]; then
    echo "$folder is not a folder. Creating new folder..."
    mkdir -p $folder
fi

echo "Thanks" > $folder/mensaje.txt
