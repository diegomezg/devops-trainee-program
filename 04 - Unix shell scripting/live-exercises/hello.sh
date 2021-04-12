#!/bin/env bash

MESSAGE="Hello World!"

HOST=$(cat /etc/HOSTNAME)
HOST_NAME=`cat /etc/HOSTNAME`
NUM_RANDOM=`echo $RANDOM`

echo "$MESSAGE, $HOST"
echo "Random number: $NUM_RANDOM"
