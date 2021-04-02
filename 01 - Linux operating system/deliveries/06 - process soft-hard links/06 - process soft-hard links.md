# Understanding  the Process, Soft Links and Hard Links in Linux  
* Describe the different types of processes (daemons, zombies, parent, child, etc.)  
>Init: is one of the first processes started when linux boots. It is a daemon process that continues running until linux is shut down. In other words, it can't be killed
* How can you list the different kind of processes?  
```
ps -au
```
>Process statuses: A snapshot of all running processes  
```
htop --delay=1000 --sort-key=PERCENT_MEM
```
>Display the same information when listing your Linux processes, but the former offers user-friendly features that are great for everyday process management
* How do you kill a process gracefully? Describe all the steps
* How do you kill a process in the least graceful way? Describe all the steps
* List all the daemons running and document the steps
* How can you check if a daemon is enabled?
* Mention a few utilities to work with processes (about 4)
* Tell us what is a soft link and a hard link, also explain the difference between these two
* Create and delete a soft link and document the process
* Create and delete a hard link and document the process
* What is an inode?