# Chef

## 02 - ChefDK

### Instructions

#### Installing the ChefDK

We'll continue utilizing CentOS 7 servers through this course, including our workstation. Once the server is running, we're ready to download the ChefDK rpm and install it. Since we're preparing for the exam, we'll be using the most recent stable release of the ChefDK (which is 2.5.3 at this time):

```
$ cd /tmp
$ curl -O https://packages.chef.io/files/stable/chefdk/2.5.3/el/7/chefdk-2.5.3-1.el7.x86_64.rpm
$ sudo rpm -Uvh chefdk-2.5.3-1.el7.x86_64.rpm
```

Now we have access to quite a few different tools that will be used in developing and testing our Chef code aswell as deploying things. We can see the top level tools and their versions by using the chef --version command.

```
$ chef --version
Chef Development Kit Version: 2.5.3
chef-client version: 13.8.5
delivery version: master (73ebb72a6c42b3d2ff5370c476be800fee7e5427)
berks version: 6.3.1
kitchen version: 1.20.0
inspec version: 1.51.21
```

Most of the tooling around Chef is written in Ruby, and this can be a source of issues when working with Chef locally sometimes because we might already have a version of Ruby installed. Before we continue let's look at what version we might be using and see how to explicitly use the ChefDK version of these packages:

```
$ which ruby
/usr/local/rvm/rubies/ruby-2.4.1/bin/ruby
```

The version that you see might not exactly match, but what we want to do when we're working with Chef is initialize our shell with all of the chef values using a subcommand off of the chef utility:

```
$ chef shell-init bash
export PATH="/opt/chefdk/bin:/home/user/.chefdk/gem/ruby/2.4.0/bin:/opt/chefdk/embedded/bin:/usr/local/rvm/gems/ruby-2.4.1/bin:/usr/local/rvm/gems/ruby-2.4.1@global/bin:/usr/local/rvm/rubies/ruby-2.4.1/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/usr/local/rvm/bin:/home/user/.local/bin:/home/user/bin:/opt/chefdk/gitbin"
export GEM_ROOT="/opt/chefdk/embedded/lib/ruby/gems/2.4.0"
export GEM_HOME="/home/user/.chefdk/gem/ruby/2.4.0"
export GEM_PATH="/home/user/.chefdk/gem/ruby/2.4.0:/opt/chefdk/embedded/lib/ruby/gems/2.4.0"
_chef_comp() {
    local COMMANDS="exec env gem generate shell-init install update push push-archive show-policy diff provision export clean-policy-revisions clean-policy-cookbooks delete-policy-group delete-policy undelete verify"
    COMPREPLY=($(compgen -W "$COMMANDS" -- ${COMP_WORDS[COMP_CWORD]} ))
}
complete -F _chef_comp chef
```

That prints out what this command does, and we can see that it modifies various environment variables so that the gems and ruby version used are the ones that come packaged with ChefDK. We'll eval this output to set these values:

```
$ eval "$(chef shell-init bash)"
$ which ruby
/opt/chefdk/embedded/bin/ruby
```

Now we know that we're using the proper version of ruby. Since our workstation is always going to want this set, let's customize our .bash_profile to do this by default.

```
$ echo 'eval "$(chef shell-init bash)"' >> ~/.bash_profile
```

#### Generating a chef-repo

When developing with Chef we'll usually be working from within a "chef-repo" that holds onto our cookbooks and dependencies and is shared amongst our team(s). There are a few different ways to get started with a chef-repo and we're going to take a look at both of them. The first way is to generate one using the chef utility. Let's create one now:

```
$ cd ~
$ chef generate repo generated-chef-repo
$ cd generated-chef-repo
$ ls -al
total 28
drwxrwxr-x.  7 user user 4096 Apr 18 17:53 .
drwx------. 10 user user 4096 Apr 18 17:53 ..
-rw-rw-r--.  1 user user 1133 Apr 18 17:53 chefignore
-rw-rw-r--.  1 user user  255 Apr 18 17:53 .chef-repo.txt
drwxrwxr-x.  3 user user   36 Apr 18 17:53 cookbooks
drwxrwxr-x.  3 user user   36 Apr 18 17:53 data_bags
drwxrwxr-x.  2 user user   41 Apr 18 17:53 environments
drwxrwxr-x.  6 user user   96 Apr 18 17:53 .git
-rw-rw-r--.  1 user user 2121 Apr 18 17:53 .gitignore
-rw-rw-r--.  1 user user   70 Apr 18 17:53 LICENSE
-rw-rw-r--.  1 user user 1499 Apr 18 17:53 README.md
drwxrwxr-x.  2 user user   41 Apr 18 17:53 roles
```

Utilizing the Chef generators makes it a lot easier for us to follow standard Chef development practices as we continue through this course. The main tool that we're going to use to connect to the Chef server is going to be the knife utility. A big difference between this repository and the one that we'll let the Chef server generate for us is that it's not pre-configured to allow us to use knife to connect to our Chef server.

Let's manually create a knife configuration to communicate with the server:

```
$ knife configure
WARNING: No knife configuration file found. See https://docs.chef.io/config_rb_knife.html for details.
Please enter the chef server URL: [https://keiththomps5.mylabserver.com/organizations/myorg] https://keiththomps4.mylabserver.com/organizations/linuxacademy
Please enter an existing username or clientname for the API: [user] keith
*****

You must place your client key in:
  /home/user/.chef/keith.pem
Before running commands with Knife

*****
Configuration file written to
```

Things to note are that we need to use the hostname from our Chef server (in this case it's keiththomps4.mylabserver.com) and also substitute in our organization's "short_name" (linuxacademy in this example).

Next, we need to copy over the pem file that we created when we created our user.

```
$ scp user@keiththomps4.mylabserver.com:/home/user/keith.pem ~/.chef/
```

Now we can connect to the Chef server using knife

```
$ knife node list
ERROR: SSL Validation failure connecting to host: keiththomps4.mylabserver.com - SSL_connect returned=1 errno=0 state=error: certificate verify failed
ERROR: Could not establish a secure connection to the server.
Use `knife ssl check` to troubleshoot your SSL configuration.
If your Chef Server uses a self-signed certificate, you can use
`knife ssl fetch` to make knife trust the server's certificates.

Original Exception: OpenSSL::SSL::SSLError: SSL Error connecting to https://keiththomps4.mylabserver.com/organizations/linuxacademy/nodes - SSL_connect returned=1 errno=0 state=error: certificate verify failed
```

We need to pull down the certificate as a trusted cert since it is self-signed. We'll follow the steps that the output points us to:

```
$ knife ssl fetch
WARNING: Certificates from keiththomps4.mylabserver.com will be fetched and placed in your trusted_cert
directory (/home/user/.chef/trusted_certs).

Knife has no means to verify these are the correct certificates. You should
verify the authenticity of these certificates after downloading.

Adding certificate for keiththomps4_mylabserver_com in /home/user/.chef/trusted_certs/keiththomps4_mylabserver_com.crt

$ knife node list
```

The self-signed certificate for our Chef server is based on the hostname, so we'll use that in our knife configuration so that it will be correct even beyond a server restart with a new IP address. Running knife node list doesn't output anything because we don't have any nodes yet, but it didn't error so we know the connection worked.

#### Utilizing a Starter Kit from the Chef Server

The alternative way that we can go about setting up a chef-repo is by downloading it from our Chef server as a "starter kit". To get to this download we need to log into the chef-manage UI to the path /organizations/[ORGANIZATION_NAME]/getting_started. From there, we need to select "Starter Kit" from the sidebar, and then click "Download Starter Kit".

A few things to note about this download:

1. By downloading this it regenerates our key file and packages the new one with the starter kit. Running knife node list after this download has starter will now fail on our workstation.
2. This will download to our local machine so we'll need to use scp to move the file to our workstation server.

```
[localmachine] $ scp chef-starter.zip user@keiththomps5.mylabserver.com:/home/user/
```

Now from the workstation, we'll need to unzip the package to be the chef-repo that we'll use moving forward:

```
[workstation] $ sudo yum install -y unzip
[workstation] $ unzip chef-starter.zip
Archive:  chef-starter.zip
  inflating: chef-repo/README.md
   creating: chef-repo/cookbooks/
  inflating: chef-repo/cookbooks/chefignore
   creating: chef-repo/cookbooks/starter/
   creating: chef-repo/cookbooks/starter/attributes/
  inflating: chef-repo/cookbooks/starter/attributes/default.rb
   creating: chef-repo/cookbooks/starter/files/
   creating: chef-repo/cookbooks/starter/files/default/
  inflating: chef-repo/cookbooks/starter/files/default/sample.txt
  inflating: chef-repo/cookbooks/starter/metadata.rb
   creating: chef-repo/cookbooks/starter/recipes/
  inflating: chef-repo/cookbooks/starter/recipes/default.rb
   creating: chef-repo/cookbooks/starter/templates/
   creating: chef-repo/cookbooks/starter/templates/default/
  inflating: chef-repo/cookbooks/starter/templates/default/sample.erb
  inflating: chef-repo/.gitignore
   creating: chef-repo/.chef/
   creating: chef-repo/roles/
  inflating: chef-repo/.chef/knife.rb
  inflating: chef-repo/roles/starter.rb
  inflating: chef-repo/.chef/keith.pem
```
  
The big difference between this repo and our generated repository is that it includes a .chef directory that is configured to speak with our Chef server, but it only works when our current working directory is within the chef-repo. Let's utilize it to connect to the Chef server.

```
[workstation] $ cd chef-repo
[workstation] $ knife ssl fetch
[workstation] $ knife node list
```

Now we're ready to move forward to use our workstation.

### Expected deliverables
- Show and explain the flow to install ChefDK. 

### Evaluation

| Metric name | Description | % Value |
| ----------- |-------------| -------:|
| 01 - Understanding  | Clear Understanding of Each of the Chef Concepts | %25 |
| 02 - Architecture Idea   | Project and Code Structure / Designed | %25 |
| 03 - Collaboration   | Team Working and Integration | %25 |
| 04 - Functional   | It could be useful for an improvement | %25 |