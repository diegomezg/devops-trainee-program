# Working with users
## Describe the process to:
### Create a user in Linux
Type _adduser_ and fill the form with the user data
### Delete a user in Linux
Type _userdel_ to remove and specific user from the OS
### Modify a user in Linux
Type _usermod_ to change user data (Group, username, lock user, change users ID)
### Change user password
You need to login as the root user, type the following command to change password for user _test_:
```sh
sudo passwd test
```
An output will ask you for a new password
### Describe the different methods to list users in Linux (/etc/passwd, id, w, who, finger)  
```sh
less /etc/passwd
```
/etc/passwd  
Local user information is stored in the /etc/passwd file. Each line in this file represents login information for one user.
```sh
id userName
uid=1000(userName) gid=1000(userName) groups=1000(userName)
```
id  
Print user and group information for the specified username  
```sh
w
17:25  up 19:47, 3 users, load averages: 11.79 6.19 3.84
USER     TTY      FROM              LOGIN@  IDLE WHAT
diegogomez console  -                Mon21   19:46 -
diegogomez s001     -                 8:51       - /usr/local/bin/com.docker.cli run -it ubuntu
diegogomez s002     -                17:25       - w
```
w  
Is used to show who is logged on and what they are doing. This command shows the information about the users currently on the machine and their processes.
```sh
who
diegogomez console  Mar 29 21:39 
diegogomez ttys001  Mar 30 08:51 
diegogomez ttys002  Mar 30 17:25 
```
who  
The who command displays the following information for each user currently logged in to the system if no option is provided :  
Login name of the users  
Terminal line numbers  
Login time of the users in to system  
Remote host name of the user

```sh
finger
Login    Name                 TTY  Idle  Login  Time   Office  Phone
diegogomez DiegoGomez          *con 19:53  Mon    21:39
diegogomez DiegoGomez           s00        Tue    08:51
diegogomez DiegoGomez           s00        Tue    17:25
```
finger  
Is a user information lookup command which gives details of all the users logged in  

## Describe the different methods to consult groups in Linux
```sh
less /etc/group
```
To view all groups present on the system
```sh
getent group
```
Getent command which displays entries from databases configured in _/etc/nsswitch.conf_ file including the group database which we can use to query a list of all groups
```sh
groups <username>
```
The groups commands is used to get a list of groups a specific user is in
## How can you delete groups in Linux?
To delete (remove) a given group from the system, invoke the groupdel command followed by the group name.
```sh
groupdel dou-devops
```
The command above removes the group entry from the /etc/group and /etc/gshadow files.  
On success, the groupdel command does not print any output.
You can verify that the group is removed, by listing all groups using the following command:
```sh
getent group | grep dou-devops
```
If the group you want to remove doesn’t exist, the system will print an error message like the following:
```sh
groupdel: group 'dou-devops' does not exist
```
## Tell us the different method to use root privileges
### Changing from user to superuser
1. sudo _command_  
Only execute the command and continue as a common user
2. sudo -i  
Needs login password, change shell to /root/home directory
3. su  
Needs root password
4. sudo -s  
Gives root access but keeps current shell