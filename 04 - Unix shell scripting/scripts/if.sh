#!/bin/bash

No_of_arguments=2

No_arguments=65
Bad_arguments=85
No_files=87
Size=89

if [[ -z "$1" && -z "$2" ]]; then
	echo -e "\nNo arguments given\n"
	exit $No_arguments
fi


if [ $# -ne $No_of_arguments ]; then
	echo -e " \nThe scrip $0 must contain 2 arguments, for example: file1.txt file2.txt\n"
	exit $Bad_arguments
fi


if [[ ! -e "$1" || ! -e "$2" ]]; then
	echo -e "\nFiles do not exist\n"
	exit $No_files
fi



if [[ ! -s "$1" || ! -s "$2" ]]; then
	echo -e "\nFiles are 0 size\n"
	exit $Size
fi


cat $1 $2 | sort >  files.txt


if [ $? -eq 0 ]; then
	echo -e "\nExecution of the script $0 was successful\n"
	cat files.txt
else
	echo -e "\nExecution of the script $0 failed\n"
fi
