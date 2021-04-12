#!/bin/bash

#trap 'echo "Listing variables thanks to my trap: m=$m n=$n o-$o"' EXIT
#trap "echo Booh!" SIGINT SIGTERM
#echo "pid is $$"

m=1
n=2
o=3

declare -t VARIABLE=value
trap "echo VARIABLE is being used here." DEBUG

sleep 200

let "sum = $m+$n+$o "
echo "The sum is ... $sum"
