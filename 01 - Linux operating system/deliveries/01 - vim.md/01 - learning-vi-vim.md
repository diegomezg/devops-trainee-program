# Learning VI and VIM by Diego Gómez
## Tell us a brief history (in your own words) about VIM and why I should learn vim
VIM is a text editor made by Bram Moolenar, the first version was published in 1991, used on linux OS distributions, based on VI the original tool for unix & you should learn to use it because:  
1. FREE (Open Source)  
2. Compact and lightweight (ONLY 6 kilobytes)  
3. Stop wasting time using a mouse  
4. Installed in almost every linux OS

## What steps are needed to create a file with vim?
apt-get install vim  
vim _filename_
## How many modes has vim to work and what do each of them do?
It has 6 modes   
* Normal, move around the file & change single characters
* Insert, insert characters just like a regular editor   
* Command, has a wide variety of commands and can do things that normal mode can’t do as easily  
* Visual, is used to make selections of text, similar to how clicking and dragging with a mouse behaves  
* Replace, allows you replace existing text by directly typing over it  
* Select, is to provide a selection behavior similar to the one used in conventional editors  

## How do you edit a file using vim?
1. Create file
```
touch vim-file.txt
```
2. Open file using Vim 
```
vim vim-file.txt
```
3. Press 'i' to start Insert mode
4. Edit the file
5. Press Esc
6. Press :w
7. Press Enter  
Now your file is edited and saved

## What commands can be used inside vim?
[Most popular Vim commands](https://www.keycdn.com/blog/vim-commands)
## What tips and tricks do you know using vim?  
1. Select characters
>v to enter visual mode
>h/l to select may characters
2. Paste text while in insert mode  
> < C - r > 0  
3. Run normal mode commands across a range  
>We have the following javascript lines and we forgot to append ;  to each of them:
```
var element = $(this)
var tabName = element.data('tab')
var report = element.data('report')
```
We can visually select all 3 lines and then run command :normal A;  that will execute A; (append ;) for each line. Alternatively, we can run same on the whole content of the file with  :%normal A;  

4. Vi mode on command line  
Bash shell provides two modes for command line editing: emacs and vi . Emacs editing mode is the default one, and we can change it to vi mode using:
```
set -o vi
```  

## Create 5 files using vim with the following naming convention: file01, file02....file05  
```
vim file01.txt 
vim file02.txt 
vim file03.txt
vim file04.txt 
vim file05.txt
```
## Add to file01 28,333 lines that contains the text "Welcome to DigitalOnUs"
You have to create a bash script to concatenate many lines:
```
#!/bin/bash
for i in {1..28333}
do
   echo "Welcome to DigitalOnUs" >> file01.txt
done
```
Then you could count lines in the file
```
wc -l file01.txt
28333 file01.txt
```
## Add to file02 11,212 lines that contains your favorite fruit  
You have to create a bash script to concatenate many lines:
```
#!/bin/bash
for i in {1..11212}
do
   echo "your favorite fruit lol" >> file02.txt
done
```
Then you could count lines in the file
```
wc -l file02.txt
11212 file02.txt
```
## Add to file03 15,313 lines that contains the text "This is practice number 3", but the line 8,303 ## should say "I'm special!"
You have to create a bash script to concatenate many lines:
```
#!/bin/bash
for i in {1..15313}
do
    if [ "$i" -eq 8303 ]
    then
        echo "Im special!" >> file03.txt
    else
        echo "This is practice number 3" >> file03.txt
done
```
## Add to file04 7,665 lines that contains your favorite quote, but the line 2,643 has to say "I like turtles"
You have to create a bash script to concatenate many lines:
```
#!/bin/bash
for i in {1..7665}
do
    if [ "$i" -eq 2643 ]
    then
        echo "I like turtles lol" >> file04.txt
    else
        echo "BUY BITCOIN" >> file04.txt
done
```
## Add to file05 1,555 lines that say "I'm working for a company" and use the replace feature to substitute the word company for "DigitalOnUs"
```
#!/bin/bash
for i in {1..1555}
do
    echo "Im working for a company" >> file05.txt
done
vim file05.txt
:%s/company/DigitalOnUs/g
```