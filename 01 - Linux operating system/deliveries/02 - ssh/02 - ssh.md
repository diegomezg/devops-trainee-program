# SSH
## Tell us a brief history about SSH and why I should learn SSH  
SSH was created in 1995 becasue of a password attack to a university, after this people want to provide secure information communication, so basically SSH its a encrypted and secure conection between computers  
You shoulds learn about SSH because:
1. Common cloud servers doesnt have GUI so the only way to manage them its using SSH
2. Its a secure communication chanel
3. It provides fingerprints of the users connection
4. Ito nly need a sheel to start working
5. It can be used to send files
## Document the steps needed to configure an SSH server  
1. Install SSH server
```
sudo apt-get install openssh-server
```
2. Customize server and save changes
```
nano /etc/ssh/sshd_config
```
3. Restart service
```
systemctl restart ssh
```
## Copy one of the files from the previous practice to one of your coworkers, document all the steps and paste screenshots as proofs  
Syntax:
```
scp <source> <destination>
```
1. To copy a file from B to A while logged into B:
```
scp /path/to/file username@a:/path/to/destination
```
In my case it looks like this
```
Virtual Machine
ip a
2: enp0s3
inet 192.168.1.138/24
```
```
Personal Computer
PS C:\Users\User\Desktop> scp C:\Users\User\Desktop\Python.jpg user@192.168.1.138:/home/user
user@192.168.1.138's password:
Python.jpg                                                                                           100%   16KB   9.8MB/s   00:00
```
Now in my VM I have the file 'Python.jpg'
```
-rw-r--r-- 1 user user 17k Apr 3 14:31 Python.jpg
```
## Customize the ssh dir using the configuration file at /etc/ssh/sshd_config and apply the following requirements:
Change the default SSH port
1. Edit config file
```
nano /etc/ssh/sshd_config
```
2. Uncomment default port to override
```
Port 2021
```
3. Restart ssh service
```
systemctl restart ssh
```
4. Allow firewall to tcp connection in new port
```
ufw allow tcp/2021
```
5. Connect to new port using ssh
```
ssh -p 2021 user@192.168.1.138
```
Disable access to root user through ssh
1. Edit config file
```
nano /etc/ssh/sshd_config
```
2. Modify root login line
```
PermitRootLogin no
```
3. Restart ssh service
```
systemctl restart ssh
```
## Create a group to enhance ssh security using the AllowGroups flag and enable ssh access for a new user called letmein, document the process  

## Create an entry banner that displays the text "Welcome stranger to DigitalOnUs" everytime a user ssh into your VM
1. Edit config file
```
nano /etc/ssh/sshd_config
```
2. Add Banner directory
```
Banner /etc/ssh/banner
```
3. Creater banner file & message
```
nano /etc/ssh/banner
```
4. Restart ssh service
```
systemctl restart ssh
```
## Config your own ssh using $USER/.ssh/config and make sure when you type server01 it connects to your coworker machine
## Document how to create an ssh key and how to copy the key into another server