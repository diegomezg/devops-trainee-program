#!/bin/bash

until [ "$n" = end ]
do
    echo "Input end to exit or something else to move on"
    read n
    echo "Your variabel is ..$n"
done
