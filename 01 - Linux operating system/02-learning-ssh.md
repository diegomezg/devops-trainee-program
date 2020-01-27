# Linux Operating System
# Learning SSH

### Instructions
Create an MD file and document the following points:
1. Tell us a brief history about SSH and why I should learn SSH
1. Document the steps needed to configure an SSH server
1. Copy one of the files from the previous practice to one of your coworkers, document all the steps and paste screenshots as proofs
1. Customize the ssh dir using the configuration file at /etc/ssh/sshd_config and apply the following requirements:
   1. Change the default SSH port
   1. Disable access to root user through ssh
   1. Create a group to enhance ssh security using the AllowGroups flag and enable ssh access for a new user called letmein, document the process
   1. Create an entry banner that displays the text "Welcome stranger to DigitalOnUs" everytime a user ssh into your VM
1. Config your own ssh using $USER/.ssh/config and make sure when you type server01 it connects to your coworker machine
1. Document how to create an ssh key and how to copy the key into another server

### Expected deliverables
- MD file with each activity question answered
- Documentation of procedures, include images if needed

### Evaluation

| Metric name | Description | % Value |
| ----------- |-------------| -------:|
| SSH history   | SSH history was told in his/her own words | 10% |
| SSH learn reasons   | At least 5 reasons were stated in his/her own words | 10% |
| SSH server config   | Document all the steps needed to have a SSH server up and running | 10% |
| Copy single file   | Document all the steps needed to copy a file over ssh, include screenshots | 10% |
| SSH port   | Default ssh port was changes and the procedure was documented | 10% |
| Root access   | Disable root access over ssh and document the steps | 10% |
| Create group   | letmein group with AllowGroups flag was created, the procedure was documented | 10% |
| Entry banner   | Entry banner was customized on ssh login | 10% |
| SSH config file   | server01 proof of connection and steps were documented | 10% |
| SSH key   | Document ssh creation and copy it to a remote server | 10% |