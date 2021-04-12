#!/bin/bash

Unix[0]='Debian'
Unix[1]='Red hat'
Unix[2]='Ubuntu'
Unix[3]='Suse'

# echo Unix[2] # prints as string
echo ${Unix[1]}


# Syntax: declare -a distros=(element1 element2 element3)
declare -a distros=('Debian' 'Red hat' 'Arch' 'Fedora' 'Mint' 'Ubuntu' 'Manjaro')

echo All elements: ${distros[@]}
echo Length: ${#distros[@]}

echo No. chars 3rd element: ${#distros[3]}

# First 1 says initial position and 2nd 2 how many elements we want
echo Slice pos 1:2: ${distros[@]:1:2}
# Output: Red hat Arch

# Extraction with offset and length. Accepts negative indices (from end to start)
ubuntu=${distros[-2]}
echo Extract 2nd element and print chars from pos 1:3: ${ubuntu:0:3}
# Output: Ubu

# Search and replace in place. # This is the good one
distros=("${distros[@]/Ubuntu/Hola}")
echo -e "\nReplacing Ubuntu by Hola: ${distros[@]}"

Unix=('Debian' 'Red hat' 'Ubuntu' 'Suse' 'Fedora' 'UTS' 'OpenLinux');
echo ${Unix[@]/Ubuntu/SCO Unix}

# Add elements to array
Unix=("${Unix[@]}" "AIX" "centos" "puppy linux")
echo "With new elements: ${Unix[@]}"

# Remove third element
unset Unix[3]
echo "After removing 3rd element: ${Unix[@]}"

# Replace Red with empty string
declare -a new_array=( ${Unix[@]/Red*/} )

echo "After removing Red*: ${new_array[@]}"

# Starts from 'o' (-7) and ends 'r' (-2)
string="Hello World"
echo $string
echo "Test: ${string: -7:-2}"

# Copy Unix into Linux array
Distros=('Debian' 'Red hat' 'Ubuntu' 'Suse' 'Fedora' 'UTS' 'OpenLinux');
Linux=("${Distros[@]}")
echo Copy of Unix: ${Linux[@]}
