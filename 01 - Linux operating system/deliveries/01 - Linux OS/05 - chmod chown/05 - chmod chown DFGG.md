# Linux OS
## Permissions and owners in linux
Linux permissions is the way you can control and manage the files and directories placed on your host, diferent types of roles can be assigned to have a better information control.
## Explain in detail the different methods to change file/directory permissions in Linux (numbers/ugo)
There are more than one way to modify linux permissions, one of the famous its using numbers, which one represents a change that could be applied to a file/directory  
0 == --- == no access  
1 == --x == execute  
2 == -w- == write  
3 == -wx == write / execute  
4 == r-- == read  
5 == r-x == read / execute  
6 == rw- == read / write  
7 == rwx == read / write / execute  
Another way could be using nomenclature based on the role you want to modify (user,group,other) and the action you want to allow (read,write,execute)
_chmod u=rwx,g=rwx,o=rwx file/dir_  
If you want to remove permissions you only have to add a _-_  
_chmod u=-rwx,g=-rwx,o=-rwx file/dir_  
If you want to allow only an specific action you should type only the asigned character  
_chmod u=r,g=x,o=w file/dir_