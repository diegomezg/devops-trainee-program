# Chef

## 01 - Chef Server

### Instructions

#### Creating the Chef Server

For this course, we’re going to use the most recent stable release of chef server (which is 12.17.331). Our first step is going to be creating a CentOS 7 cloud server to be used as our Chef server. After that server is running, we need to get the download link for a Redhat 64bit system from the downloads page (here’s the exact link used in this video). Let’s use curl to copy this onto our server so that we can install it. Since we’ll need to run virtually all of these commands using sudo we’ll switch to root at the start:

```
$ sudo su -
[root] $ cd /tmp
[root] $ curl -O https://packages.chef.io/files/stable/chef-server/12.17.33/el/7/chef-server-core-12.17.33-1.el7.x86_64.rpm
[root] $ rpm -Uvh chef-server-core-12.17.33-1.el7.x86_64.rpm
```

This might take a few moments, but this will install Cher Server and provide us with a few more utilities. Chef Server is a collection of many different services, and we’ll need to configure those before we can do anything with the server. Chef Server utilizes Chef itself to configure its own services and we’ll see this in the output from our next command:

Note: This command can take quite awhile complete.

```
[root] $ chef-server-ctl reconfigure
```

Let’s take a better look at what it takes to operate the chef server by looking at the services that it manages:

```
[root] $ chef-server-ctl service-list
okshelf*
nginx*
oc_bifrost*
oc_id*
opscode-chef-mover*
opscode-erchef*
opscode-expander*
opscode-solr4*
postgresql*
rabbitmq*
redis_lb*
```

The * on each line indicates that the service is enabled and running. As we can see, it takes quite a few dependent services to make the Chef server work. As we go through this course we’ll learn more and more about what the Chef server itself does.

#### Creating Our User and Organization

Before we can move on, we need to set up a user and an organization to belong to. Organizations are the umbrella that we will register nodes under and associate cookbooks with as we move forward. Let’s start by creating our user:

```
[root] $ # chef-server-ctl user-create USER_NAME FIRST_NAME LAST_NAME EMAIL 'PASSWORD' --filename FILE_NAME
[root] $ chef-server-ctl user-create keith Keith Thompson keith@linuxacademy.com 'p@ssw0rd' --filename /home/user/keith.pem
```

This will create a username of keith and some extra metadata. An important thing to notice here is that the --filename output is an RSA key that we can use to interact with the Chef server from our workstation later on. Our next step will be creating an organization and setting ourself as the first admin user. We can do this using a similar subcommand on the chef-server-ctl utility:

```
[root] $ # chef-server-ctl org-create SHORT_ORG_NAME 'FULL_ORG_NAME' --association_user USER_NAME --filename FILE_NAME
[root] $ chef-server-ctl org-create linuxacademy 'Linux Academy, Inc.' --association_user keith --filename linuxacademy-validator.pem
```

This command is very similar to our user creation command, but it is important to note that there are some validation rules for the SHORT_ORG_NAME that we need to follow:

1. Must start with a lowercase letter or number.
2. Can only contain lowercase letters, digits, hyphens, and underscores.
3. Must be between 1 and 255 characters long.

The --association_user flag will take an existing user’s username and associate it with the admin security group on the Chef server. Lastly, the --filename flag stores off the organization’s validator pem. We won’t be using this file during this course.

#### Adding chef-manage Web UI

The last thing we’re going to do with our Chef server right now is install a web UI add-on called “Chef Manage”. This add-on gives us a web-based way to see all of the Chef related information that we’ll need around our organization including node information, cookbook versions, and more. Once again, we will install this add-on using the chef-server-ctl utility:

```
[root] $ chef-server-ctl install chef-manage
```

Note: this installation can take quite awhile.

After the installation is finished, there are still a few more steps for us to take before we can use the UI:

```
[root] $ chef-server-ctl reconfigure
...
[root] $ chef-manage-ctl reconfigure
To use this software, you must agree to the terms of the software license agreement.
Press any key to continue.
... # License Agreement will Open
Type 'yes' to accept the software license agreement, or anything else to cancel.
yes
```

Note: You'll will need to close the license agreement by hitting q before you can type `yes`.

After we accept the license agreement then another chef-client run will occur configuring the services managed by chef-manage. Once the reconfiguration has finished, we can access the UI by going to https://SERVER_PUBLIC_IP. We need to tell the browser that we understand that the website is using a self-signed certificate, and after we do that we can see that there is a sign in form. We’ll ensure that the username/password created earlier works, and then we’re ready to move forward.

### Expected deliverables
- Show and explain the flow to install chef server. 


### Evaluation

| Metric name | Description | % Value |
| ----------- |-------------| -------:|
| 01 - Understanding  | Clear Understanding of Each of the Chef Concepts | %25 |
| 02 - Architecture Idea   | Project and Code Structure / Designed | %25 |
| 03 - Collaboration   | Team Working and Integration | %25 |
| 04 - Functional   | It could be useful for an improvement | %25 |
