#!/bin/bash

#Print name
echo Diego Gomez
#Print current folder
pwd
 #Create a folder "example"
 mkdir example
 #Create 2 files with different names
 touch file-one.txt file-two.txt
 #Move first file to the new folder
 mv file-one.txt example
 #Insert the current date to the second file
 echo $(date) > file-two.txt
 #Print the second file content
 cat file-two.txt
 #Change your folder to the new one
 cd example
 #Print the current folder
 pwd
 #Show what is there
 ls -lha
 #And finally remove everything that you create before.
 cd ..
 rm -r example 
 rm file-two.txt