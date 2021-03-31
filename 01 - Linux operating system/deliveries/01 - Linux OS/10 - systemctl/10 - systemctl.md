# Systemctl in Linux
* Tell us the history about systemD and systemV  
Systemd: Created by Lennart Poettering and Kay Sievers, wants to be a sustitute for init, since 2015 linux distributions have adopted it to improve daemons
Systemv: Created by AT&T in 1983, its the first system process and the main service on Linux SO to change Linux kernel and configurations
* What's the difference between enabled and running?  
Enable: A service starts when the machine turn on  
Running: A service starts only when user changes the state 
* What are the available targets in centos 7? (multi-user, desktop, etc)  
Run Level	Target Units	Description  
* 0	runlevel0.target, poweroff.target	Shut down and power off  
* 1	runlevel1.target, rescue.target	Set up a rescue shell  
* 2,3,4	runlevel[234].target, multi- user.target	Set up a nongraphical multi-user shell  
* 5	runlevel5.target, graphical.target	Set up a graphical multi-user shell  
* 6	runlevel6.target, reboot.target	Shut down and reboot the system  