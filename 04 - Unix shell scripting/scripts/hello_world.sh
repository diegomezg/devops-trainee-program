#!/bin/bash

functions()

{

	clear

	echo -e "\nWrite the file name for this practice\n"

	read filename

	echo -e "Hello \t\t\t\t\t World" >> ${filename}.txt 

	clear

	echo -e "\nYour file was created with the name ${filename}.txt \n\n"

}


functions
