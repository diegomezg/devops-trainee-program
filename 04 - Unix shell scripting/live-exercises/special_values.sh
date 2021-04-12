#!/bin/bash

if [ -z "$2" ]; then
    echo Second argument is mandatory.
    exit 29
fi

echo """
Script name: $0

First argument: ${1:-first}
Second argument: $2
Third argument: $3
Process ID: $$
Current line: $LINENO

No. arguments: $#
All arguments: $@
"""

for argument in "$@"; do
    echo $argument
done
