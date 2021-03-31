#!/bin/bash

#Enable and start a daemon, document the process
systemctl enable apache2
#Start daemon
systemctl start apache2
#Display daemon status
sudo systemctl status apache2