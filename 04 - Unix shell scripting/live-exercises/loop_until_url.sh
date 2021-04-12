#!/bin/bash

# Retry curl until localhost:3000 is available.
LIMIT=5
COUNTER=0
until curl -s http://localhost:3000; do
    sleep 2;
    echo retrying $COUNTER;

    if (( $COUNTER == $LIMIT )); then
        break
    fi
    COUNTER=$(($COUNTER+1))
done
