#!/bin/bash

source nested_functions.sh

echo $NUMBER

f1
f2

echo "Inside nested_functions_v2.sh $MY_NAME"

export HELLO=World

# Function with return
function get_random_number() {
    return $RANDOM
}

function get_random_number_v2() {
    # return "Hola"  # Only numeric values
    return $RANDOM
}

get_random_number
random_1=$?

get_random_number_v2
random_2=$?

echo R: $random_1 $random_2
