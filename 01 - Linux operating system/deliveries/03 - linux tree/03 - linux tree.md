# Learning the Linux structure for the directories
## Follow along the directory workshop and explain in your own words the purpose of each directory
* lib  
>It includes the essential libraries that are necessary for all the binaries found in the /bin and /sbin directories to run correctly, as well as the kernel modules itself
* lib32  
>Libraries or tools for 32bits based systems
* lib64
>Libraries or tools for 64bits based systems
* lost+found  
> Files that would normally be lost. Some of these might be lost directories or lost files or even . Each filesystem should have its own lost+found directory, but you might be looking at a system with only one filesystem
* media  
>Contains subdirectories where removable media devices inserted into the computer are mounted. For example, when you insert a CD into your Linux system, a directory will automatically be created inside the /media directory
* mnt  
>Directory and its subdirectories are intended for use as the temporary mount points for mounting storage devices, such as CD's & USB
* opt  
>Directory used for the installation of software packages
* proc  
>Directory holds all the details about your Linux system, including its kernel, processes, and configuration parameters
* root  
>Home directory for root user
* run  
>Directory where information of the systemits provided since it was booted  
* sbin  
>Directory for root user in Linux and other Unix-like operating systems that contains executable programs. They are mostly administrative tools
* srv  
>contains site-specific data which is served by this system.  This main purpose of specifying this is so that users may find  the location of the data files for particular service, and so that  services which require a single tree for readonly data, writable data and scripts
* sys  
>Directory as a virtual filesystem, which stores and allows modification of the devices connected to the system
* tmp  
>Contains necessary files that are temporarily required by the system as well as other software and applications running on the machine
* usr  
>Consists of several subdirectories that contain additional UNIX commands and data files. It is also the default location of user home directories
* var  
>Contains things that are prone to change, such as websites, temporary files (/var/tmp) and databases. The name is an abbreviation of "variable".