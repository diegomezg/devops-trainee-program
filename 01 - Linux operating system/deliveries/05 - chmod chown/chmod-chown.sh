#!/bin/bash

# Create an empty file called January
touch January.txt
# Change permissions to 
# January - read/write for user and only read for groups and for the others only execution
chmod u=rw,g=r,o=x January.txt
# Create an empty file called February
touch February.txt
# Change permissions to
# February - read/write/exec for user and read/write for groups and for the others no permissions at all
chmod u=rwx,g=rw,o=-xrw
# Create a new user called dou
adduser dou
#Change owner to new user
chown dou /January.txt
chown dou /February.txt