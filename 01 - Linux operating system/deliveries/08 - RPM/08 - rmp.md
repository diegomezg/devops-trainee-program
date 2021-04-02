# Red Hat Package Manager
## What is an RPM package?  
>A compressed file archive containing all of the files that come with a particular application. The files are usually stored in the package according to their relative installation paths on your system  

## What is a dependency in Linux?  
>When you install programs, they rely on other programs to work. These other programs are called dependencies, a dependency occurs when one package depends on another. You might think it would make for an easier-to-manage system if no package depended on any others, but you’d face a few problems, not the least of which would be dramatically increased disk usage.  

## What is a repository in Linux?  
>Is a storage location from which your system retrieves and installs OS updates and applications. Each repository is a collection of software hosted on a remote server and intended to be used for installing and updating software packages on Linux systems  

## Install an RPM package, document the process  
1. To install a .rpm package in CentOS, enter the following:  
```
sudo rpm –i sample_file.rpm
```
The –i switch tells the package manager you want to install the file  

## Remove an RPM package, document the process  
1. You should then find the exact package name:
```
pm -qa|grep package_name
```
2. Then run to uninstall the package  
```
rpm -e package_name
```
## How can you list all the installed packages using RPM?  
* Type to count packages:  
```
rpm -qa | wc -l
292
```
* Type to show packages name:  
```
rpm -qa
filesystem-2.4.0-1
comps-extras-11.1-1.1
gnome-mime-data-2.4.2-3.1
```