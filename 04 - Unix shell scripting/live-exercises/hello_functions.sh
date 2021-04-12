#!/bin/bash

function say_hello() {
    NAME=$1
    LAST_NAME=$2
    local random_n=$RANDOM
    echo "Local random: $random_n"

    random_n_global=$RANDOM
    echo Hello, $NAME $LAST_NAME
}

BASH_CONFIG_FILE=${1:-/etc/bashrc}
VIM_CONFIG_FILE=${2:-/usr/share/vim/vimrc}
echo """
Script name: $0
Bash Config File: $BASH_CONFIG_FILE
Second argument: $VIM_CONFIG_FILE
"""

# Exec say_hello
say_hello "Susana" "Garcia"

echo "random_n = $random_n"
echo "random_n_global = $random_n_global"
