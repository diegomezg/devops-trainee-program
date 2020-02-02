#!/bin/bash

until [ "$n" = end ]
do
	echo -e "\nInput end to exit or something else to move on\n"
        read n
        echo -e "\nYour variabel is ..$n\n\n"
done

