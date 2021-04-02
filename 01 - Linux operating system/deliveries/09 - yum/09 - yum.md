# YUM  in Linux
## Tell us the history of yum  
Yum or Yellow dog Update, Modified is a package manager developed by Duke University to improve the installation of RPMs.
Yum searches numerous repositories for packages and their dependencies so that they can be installed together in an effort to alleviate dependency problems. Red Hat Enterprise Linux 5 uses Yum to pick up the packages and install the RPMs.  

## Mention the config files that yum uses  
The configuration file for yum and related utilities is located at /etc/yum.conf. This file contains one mandatory section, which allows you to set Yum options that have global effect, and can also contain one or more sections, which allow you to set repository-specific options  

## What is the difference between yum and yum group  
_Yum provides two ways to install software_
### yum install
* It installs a single piece of software and the dependencies of this software
### yum group install
* It installs an installation package that contains a lot of individual software and the dependencies of individual software  

## How can you list all the installed packages using yum?  
The list command dumps lists of packages depending on the packages’ relation to the system  
The list command can also limit the displayed packages according to other criteria, e.g. to only those that update an installed package  
The exclude option in configuration file (.conf) might influence the result, but if the command line option –disableexcludes is used, it ensure that all installed packages will be listed
```
sudo yum list --installed
```