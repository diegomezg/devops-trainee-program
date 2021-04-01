# Basic Commands
## Explain and give an example of the following commands:  
### LIST
* ls   
List files and directories within the file system and shows detailed information about them
```
ls -lha var/
total 3
drwxr-xr-x  2 root root  4.0K Mar 19 23:44 backups
drwxr-xr-x  5 root root  4.0K Mar 29 00:00 cache
drwxr-xr-x  7 root root  4.0K Mar 29 00:00 lib
```
### COPY  
* cp  
A command-line utility for copying files and directories
```
cp my-file.js backup-file.js
```
### MOVE
* mv   
Command used to rename and move files/directories from one location to another
```
mv initial.js renamed.js
mv index.js /project-directory
```
### REMOVE
* rm  
Command used to remove files and directories
```
rm index.js
rm /erase-me-please
```
### DISK USAGE
* du  
Short for “disk usage” reports the estimated amount of disk space used by given files or directories
```
du -ah /bin/ | sort
1.2M    /bin/bash
108K    /bin/date
108K    /bin/lsblk
```
### DISK FILESYSTEM
* df  
It defines the number of blocks used, the number of blocks available, and the directory where the file system is mounted
```
df
Filesystem     1K-blocks  Used Available Use% Mounted on
overlay         20642512 18564  19558988   1% /
tmpfs              65536     0     65536   0% /dev
tmpfs             503484     0    503484   0% /sys/fs/cgroup
```
### PRINT WORKING DIRECTORY
* pwd  
When invoked the command prints the complete path of the current working directory
```
pwd
/usr/games
```
### MAKE SUBDIRECTORY
* mkdir  
The command that allows you to create directories
```
mkdir downloads
ls -lha
drwxr-xr-x 2 root root 4.0K Mar 31 03:44 downloads
```
### CONCATENATE
* cat  
It can read, concatenate, and write file contents to the standard output. If no file is specified or the input file name is specified as a single hyphen (-), it reads from the standard input
```
cat /etc/issue
```
### MORE
* more  
Used to view the text files in the command prompt, displaying one screen at a time in case the file is large
```
more -d lorem-ipsum.txt
```
### LESS
* less  
Displays the contents of a file or a command output, one page at a time
```
less -N lorem-ipsum.txt
```
### CHANGE DIRECTORY
* cd  
Used to change the current working directory
```
cd /home/username/Downloads
```
### TOUCH FILE
* touch  
Allows us to update the timestamps on existing files and directories as well as creating new, empty files
```
touch -d '1 June 2018 11:02' index.js
```
### CLEAR
* clear  
So, how do you clear terminal in Linux? The simplest and the most common way is to use the clear
```
clear
```
### TAIL
* tail  
 Displays the last part (10 lines by default) of one or more files or piped data. It can be also used to monitor the file changes in real time
 ```
tail -n 50 lorem.txt
 ```
 ### HEAD
 * head  
Prints the first lines (10 lines by default) of one or more files or piped data to standard output
 ```
head -n 30 lorem.txt
  ```
### HISTORY
* history  
Allows to view a list of previously executed commands, search through the list, and manipulate the history file
```
history | grep nano
302  sudo nano /etc/resolv.conf
356  nano setup.py
413  sudo nano /etc/hosts
469  nano +22,5 functions.sh
```
### EJECT
* eject  
Allows removable media (typically a CD-ROM, floppy disk, tape, JAZ, ZIP or USB disk) to be ejected under software control
```
eject -f cdrom
```
### UNAME
* uname  
Prints basic information about the operating system name and system hardware
```
uname -a
Linux 3cccf04cf5ce 4.19.27-linuxkit #1 SMP Sun Mar 10 18:51:44 UTC 2019 x86_64 GNU/Linux
```
### BLOCK DEVICES INFORMATION
* blkid  
Displays information about available block devices. It can determine the type of content a block device holds and also attributes from the content metadata
```
blkid
/dev/vda1: UUID="7fa9c421-0054-4555-b0ca-b470a97a3d84" TYPE="ext4"
/dev/vda2: UUID="7IvYzk-TnnK-oPjf-ipdD-cofz-DXaJ-gPdgBW" TYPE="LVM2_member"
/dev/mapper/vg_kvm-lv_root: UUID="a07b967c-71a0-4925-ab02-aebcad2ae824" TYPE="ext4"
/dev/mapper/vg_kvm-lv_swap: UUID="d7ef54ca-9c41-4de4-ac1b-4193b0c1ddb6" TYPE="swap"
```
### LIST PCI DEVICES
* lspci  
List information about the PCI connected devices on your system. This can be useful to know what hardware peripherals you have
```
lspci
00:00.0 Host bridge: Intel Corporation 5500 I/O Hub to ESI Port (rev 13)
00:01.0 PCI bridge: Intel Corporation 5520/5500/X58 I/O Hub PCI Express Root Port 1 (rev 13)
```
### TYPE OF A FILE
* file  
Displays the type of a file. It’s helpful when you have to find out the type of file you’ve never seen before or the file does not have a file extension
```
file -b /etc/group
ASCII text
```
### DATE
* date  
Displays or sets the system date. It is most commonly used to print the date and time in different formats and calculate future and past dates
```
date
Sat Jun  1 14:31:01 CEST 2019
```
### UPTIME
* uptime  
 Used to find out how long the system is active (running)
```
uptime
23:00:47 up 6 min,  0 users,  load average: 0.00, 0.00, 0.00
```
### LAST
* last  
Display the list of all the users logged in and out since the file /var/log/wtmp was created
```
last -s yesterday -t today
wtmp begins Sat Feb 13 22:00:25 2021
```
### MANUAL
* man  
Display the user manual of any command that we can run on the terminal
```
man ls
NAME
       ls - list directory contents
SYNOPSIS
       ls [OPTION]... [FILE]...
```
### LAST LOGIN
* last login  
Displays the last time the user logged in
```
last login
wtmp begins Thu Jan  1 00:00:00 1970
```
### POWEROFF
* poweroff  
Power off the machine
```
poweroff
```
### REBOOT
* reboot  
Reboot the machine
```
reboot now
```
### EXIT
* exit  
 Used to exit the shell where it is currently running
```
exit
```