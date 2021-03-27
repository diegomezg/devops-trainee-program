#!/bin/bash

clear

echo -e "\nHow many files do you want to create ? \n"

read user

if [[ ! $user =~ ^[0-9]+$ ]]; then
	echo -e "\nPlease enter a number\n"
else
	for i in $( seq 1 $user );do touch text_number_$i.txt;done
fi
