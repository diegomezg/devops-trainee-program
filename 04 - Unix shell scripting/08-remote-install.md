# Unix Shell Scripting

## Install Nginx on remote server

### Instructions

For this practice you will be given an IP from a remote server and a key to access it.

1. Create the script file with the proper name
2. Make sure first line contains the ``shebang`` character followed by the absolute path to the bash executable binary
3. Describe program purpose using a bash comment
4. Create a config file where you will store the following variables:
   1. Remote IP/hostname
   2. User
   3. Key path
5. In the main script
   1. Make sure to use debug and exit options
   2. Source the config file to load variables
6. SSH into a different host and install Nginx web server
   1. If installed, prompt to ask if want to perform a fresh installation and remove existing one
   2. Else, continue with the existing one
7. Enable and start nginx
8. In the remote server use ``git clone`` to retrieve a static web site and set it up to be served by nginx

**NOTE**: if there are issues accessing the site, you will have to demonstrate your troubleshooting skills
          by checking the logs, working with firewalls, etc.

### Expected deliverables

Nginx server up and running a static web site.

### Evaluation

| Metric Name  | Description                                        | % Value |
| ------------ | -------------------------------------------------- | ------- |
| Quality      | Script is short, understandable, clean, light etc. | 20      |
| Instructions | Instructions are included within the script        | 40      |
| Deliverable  | Script is working properly                         | 40      |
