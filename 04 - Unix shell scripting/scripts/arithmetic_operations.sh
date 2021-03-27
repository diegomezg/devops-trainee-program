#!/bin/bash

clear

while true
do
	echo -e "\nWhich operation would you like to do:\n"
        echo -e "1. Addition\n"
        echo -e "2. Substraction\n"
        echo -e "3. Multiplication\n"
        echo -e "4. Division\n"
	echo -e "5. Exit\n\n"
	read n

if [ $n -eq 1 ] || [ $n -eq 2 ] || [ $n -eq 3 ] || [ $n -eq 4 ] || [ $n -eq 5 ]; then

	if [[ "$n" -eq 1 ]]; then
		clear
        	echo -e "###############################################################################\n\n"
		echo -e "\nInput your first number\n"
		read n1
		echo -e "\nInput your second number\n"
		read n2
		let "nf = (($n1 + $n2))"
		echo -e "\n\n $n1 plus $n2 = $nf\n\n"
		echo -e "###############################################################################\n\n"
        fi

        if [[ "$n" -eq 2 ]]; then
		clear
		echo -e "###############################################################################\n\n"
		echo -e "\nInput your first number\n"
                read n1
                echo -e "\nInput your second number\n"
                read n2
                let "nf = (($n1 - $n2))"
                echo -e "\n\n $n1 minus $n2 = $nf\n\n"
		echo -e "###############################################################################\n\n"
        fi

        if [[ "$n" -eq 3 ]]; then
		clear
		echo -e "###############################################################################\n\n"
        	echo -e "\nInput your first number\n"
                read n1
                echo -e "\nInput your second number\n"
                read n2
                let "nf = (($n1 * $n2))"
                echo -e "\n\n $n1 times $n2 = $nf\n\n"
		echo -e "###############################################################################\n\n"
	fi

        if [[ "$n" -eq 4 ]]; then
                clear
		echo -e "###############################################################################\n\n"
        	echo -e "\nInput your first number\n"
                read n1
                echo -e "\nInput your second number\n"
                read n2
                let "nf = (($n1 / $n2))"
                echo -e "\n\n $n1 divided by $n2 = $nf\n\n"
		echo -e "###############################################################################\n\n"
	fi

	if [[ "$n" -eq 5 ]]; then
                clear
		echo -e "###############################################################################\n\n"
		echo -e "\n\n Good Bye...!!!\n\n"
		echo -e "###############################################################################\n\n"
		break
        fi

	else
                clear
                echo -e "###############################################################################\n\n"
                echo -e "\n\n Just choose from 1 to 5 please ...\n\n"
                echo -e "###############################################################################\n\n"

fi
done
