# Understanding  the Process, Soft Links and Hard Links in Linux  
* Describe the different types of processes (daemons, zombies, parent, child, etc.)  
>Init: is one of the first processes started when linux boots. It is a daemon process that continues running until linux is shut down. In other words, it can't be killed  

>Parent: A parent process is a process that has created other processes known as children. Child processes belong to the parent and are terminated with the parent. In linux, every process has a parent except the init process and a few other kernal processes  

>Child: A child is a process that has been created by a parent. In linux, all processes except init are children of a process. When you kill a child process the parent doesn't terminate. The command ps can be used to identify the id of the parent for each process  

>Interactive: An interactive process is initialized and controlled through a terminal session. These may display output to a user and collect user input such as commands. Interactive processes have the terminal session process as a parent and are terminated with the session. When you run a command from a command prompt it is run as an interactive process by default and will not survive when you close the terminal window.  

>Background:  A background process is a process that is run independently of a terminal session. This can be run from a terminal session with the following syntax  

>Daemon: is called as a type of program which quietly runs in the background rather than under the direct control of a user. When a specific event or condition or process occurrence that time a daemon gets initiated usually. These processes can be a result of some other program which is managed by the kernel like SSH & APACHE2  

>Zombie: Is a process whose execution is completed but it still has an entry in the process table. Zombie processes usually occur for child processes, as the parent process still needs to read its child’s exit status  

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
>
* How do you kill a process in the least graceful way? Describe all the steps
* List all the daemons running and document the steps
* How can you check if a daemon is enabled?
* Mention a few utilities to work with processes (about 4)
* Tell us what is a soft link and a hard link, also explain the difference between these two
* Create and delete a soft link and document the process
* Create and delete a hard link and document the process
* What is an inode?