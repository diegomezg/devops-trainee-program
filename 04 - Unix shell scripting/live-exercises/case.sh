#!/bin/bash

echo -n "Do you agree with this? [yes or no]: "
read yno

case $yno in
    # [yY]* ) echo "Agreed";;  # Regex y or Y zero or more times
    # no ) echo "Disagree";;   # Exact match 'no' string
    [yY] | [yY][Ee][Ss] ) echo "Agreed" ;;
    [nN] | [nN][Oo]   ) echo "Not agreed, you can't proceed the installation"; exit 1 ;;
    * )   echo "Invalid input" ;;
esac
