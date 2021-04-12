#!/bin/bash

echo "Lists all shell scripts files type"
# for f in `ls *.sh`; do
for f in $(ls *.sh)
do
    # echo "File $f";
    file $f
done
