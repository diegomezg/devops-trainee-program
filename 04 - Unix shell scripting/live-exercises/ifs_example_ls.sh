#!/bin/bash

function list_files() {
    # IFS deals with file names with spaces
    # http://www.gnu.org/software/bash/manual/html_node/ANSI_002dC-Quoting.html#ANSI_002dC-Quoting
    IFS=$'\n'
    for f in `ls`; do
        echo "Filename: $f"
        file $f
    done
}

list_files

colors1="red::::::::::::::::::brown::::::::orange"
colors2="black:yellow:white"
echo -e "\nEn este ejemplo elimina el colon : para separar los colores"
IFS=:
echo $colors1
echo $colors2
