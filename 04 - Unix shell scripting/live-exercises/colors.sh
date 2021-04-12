#!/usr/bin/env bash

# Author: Jorge Gongora

set -e -u -o pipefail

main () {
    declare -A COLORS=( ["black"]=0
                        ["brown"]=1
                        ["red"]=2
                        ["orange"]=3
                        ["yellow"]=4
                        ["green"]=5
                        ["blue"]=6
                        ["violet"]=7
                        ["grey"]=8
                        ["white"]=9 )

    value=${COLORS[$1]}${COLORS[$2]}

    if [ "${#value}" -eq 2 ]; then
        echo "${value}"
    else
        echo "invalid color"
        exit 1
    fi
}

# if [ $# -lt 2 ]; then
#     echo "Not enough arguments"
#     exit 1
# fi

# call main with all of the positional arguments
main "$@"
