#!/bin/bash

up=$'\x1b[A'
down=$'\x1b[B'
left=$'\x1b[D'
right=$'\x1b[C'

clear

read -s -n3 -p "Press an arrow key : " arrow

clear

case "$arrow" in

$up     )       echo -e "Your pressed up\n";;
$down   )       echo -e "You pressed down\n";;
$left   )       echo -e "You pressed left\n";;
$right  )       echo -e "You pressed right\n";;

esac
