#!/bin/bash

LIMIT_TIME=12
TIME_INTERVAL=2

echo """
This script will run for $LIMIT_TIME Seconds...
"""
echo -e "Press CTRL+C to exit before the time limit\n"

while [ "$SECONDS" -le "$LIMIT_TIME" ]
do
    echo "This Script $0 has been running for $SECONDS seconds."
    sleep $TIME_INTERVAL
done
