#!/bin/bash

MAX=10
i=1

while [ "$i" -le "$MAX" ]
do
	var=$RANDOM
        echo -e "\n$var\n"
        let "i += 1"
done
