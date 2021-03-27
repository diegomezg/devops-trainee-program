#!/bin/bash

clear

echo -e "\nWrite anything in lowercase...\n"

read var1

clear

echo -e "\nThis is your result with the first letter in uppercase:"

echo -e "\n${var1^}\n\n\n"

echo -e "\nThis is your result with all text in uppercase:"

echo -e "\n${var1^^}\n\n\n"
