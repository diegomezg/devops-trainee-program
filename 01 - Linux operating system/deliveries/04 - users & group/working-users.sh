#!/bin/bash

#Create dou-devops group
groupadd dou-devops
#Create user dou-diego
adduser dou-diego
#Add the users dou-YOUR_NAME to the previous group
usermod -a -G dou-devops dou-diego 
#Delete the user dou-YOUR_NAME users from the dou-devops group
gpasswd -d dou-diego dou-devops