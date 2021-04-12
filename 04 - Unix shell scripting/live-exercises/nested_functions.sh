#!/bin/bash

f1() {
    f2() {
        echo "Function f2, inside f1"
    }

    # Global variable
    n=$RANDOM

    # Calling nested function `f2`
    # f2
    echo "f1 message"
}

NUMBER=$RANDOM
export MY_NAME=Alex

echo "Inside nested_functions.sh $MY_NAME"

# f2  # f2 is undefined
# f1
# 
# # n and f2 are defined inside f1
# echo "Random number: $n"
# f2
