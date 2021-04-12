#!/bin/bash

echo -n "Filename: "
read file_to_read

if [ ! -e $file_to_read ]; then
    echo "File does not exist."
    exit 1
fi

# if [ -f $file_to_read ]; then
file_info=`file $file_to_read`
if [[ $file_info =~ "ASCII text" ]]; then
    echo "$file_to_read is a regular file"
    cat $file_to_read
else
    echo "Only regular files are alowed."
    exit 2
fi
