#!/bin/bash

function read_file() {
    echo "Arg: $1"

    file_name=$1
    if [ ! -e $file_name ]; then
        echo "File does not exist."
        exit 1
    fi

    file_info=`file $file_name`
    if [[ $file_info =~ "ASCII text" ]]; then
        echo "$file_name is a regular file"
        file_content=$( < $file_name )
        echo "$file_content"  # Quoting variable to print new lines
    else
        echo "Only regular files are allowed."
        exit 2
    fi
}

read_file "$@"
