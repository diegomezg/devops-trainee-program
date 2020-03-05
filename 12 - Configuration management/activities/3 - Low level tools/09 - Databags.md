# Chef

## 09 - Databags Instructions

### What are Data Bags?

Data bags are pieces of JSON data that are stored in the Chef Server. They're searchable and also available within recipes. Where attributes can be a little complicated because of the precedence order, data bags are relatively simple. Data bags have names and then items underneath. To explore using data bags, we're going to improve our bcf_users cookbook by changing it to wrap around the users cookbook that is officially managed by Chef (the company).

The users cookbook provides us with a new users_manage resource that allows us to manage the users on our servers by setting information in data bags, preventing us from hardcoding values like we have already (which we would also be doing if we used attributes).

### Working with Data Bags

The default data bag that the users_manage resource expects is called users, so we'll create that now using knife data bag create.

```
[workstation] chef-repo $ knife data bag create users
Created data_bag[users]
The users data bag can hold an arbitrary number of items that will represent individual users and there are certain values that the users_manage resource can work with. Here's an example data bag item:

{
  "id": "test_user",
  "password": "$1$5cE1rI/9$4p0fomh9U4kAI23qUlZVv/",
  "ssh_keys": [
  "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAklOUpkDHrfHY17SbrmTIpNLTGK9Tjom/BWDSU\nGPl+nafzlHDTYW7hdI4yZ5ew18JH4JW9jbhUFrviQzM7xlELEVf4h9lFX5QVkbPppSwg0cda3\nPbv7kOdJ/MTyBlWXFCR+HAo3FXRitBqxiX1nKhXpHAZsMciLq8V6RjsNAQwdsdMFvSlVK/7XA\nt3FaoJoAsncM1Q9x5+3V0Ww68/eIFmb1zuUFljQJKprrX88XypNDvjYNby6vw/Pb0rwert/En\nmZ+AW4OZPnTPI89ZPmVMLuayrD2cE86Z/il8b+gw3r3+1nKatmIkjn2so1d01QraTlMqVSsbx\nNrRFi9wrf+M7Q== chefuser@mylaptop.local",
  "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAklOUpkDHrfHY17SbrmTIpNLTGK9Tjom/BWDSU\nGPl+nafzlHDTYW7hdI4yZ5ew18JH4JW9jbhUFrviQzM7xlELEVf4h9lFX5QVkbPppSwg0cda3\nPbv7kOdJ/MTyBlWXFCR+HAo3FXRitBqxiX1nKhXpHAZsMciLq8V6RjsNAQwdsdMFvSlVK/7XA\nt3FaoJoAsncM1Q9x5+3V0Ww68/eIFmb1zuUFljQJKprrX88XypNDvjYNby6vw/Pb0rwert/En\nmZ+AW4OZPnTPI89ZPmVMLuayrD2cE86Z/il8b+gw3r3+1nKatmIkjn2so1d01QraTlMqVSsbx\nNQCPO0ZZEa1== chefuser@mylaptop.local"
  ],
  "groups": [ "testgroup", "nfsgroup" ],
  "uid": 9001,
  "shell": "\/bin\/bash",
  "comment": "Test User",
  "home": "/home/test_user",
  "action": "create",
  "ssh_private_key": "...",
  "ssh_public_key": "..."
}
```

We need to encrypt the Jenkins user's password before creating the data bag for it:

```
[workstation] chef-repo $ openssl passwd -1 "secure_password"
$1$6eMmUKIy$8QdyDIyDnwmNTkjKKWbvq.
From our bcf_users cookbook our information for the jenkins user would look like this:

jenkins.json

{
  "id": "jenkins",
  "comment": "A user for CI/CD",
  "password": "$1$6eMmUKIy$8QdyDIyDnwmNTkjKKWbvq.",
  "groups": ["ci"],
  "uid": 2001
}
```

Now we'll add this item to the data bag:

```
[workstation] chef-repo $ knife data bag create users jenkins
Data bag users already exists
Created data_bag_item[jenkins]
```

We'll also create a user for ourselves (the user user) that includes SSH key information so that we no longer need to use passwords to SSH to our nodes. An alternative way to create an manage a data bag is to use a JSON file within the repo. We'll create a directory and a JSON file.

```
[workstation] chef-repo $ mkdir -p data_bags/users
[workstation] chef-repo $ touch data_bags/users/user.json
[workstation] chef-repo $ ssh-keygen -t rsa -C "keith@linuxacademy.com"
Generating public/private rsa key pair.
Enter file in which to save the key (/home/user/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/user/.ssh/id_rsa.
Your public key has been saved in /home/user/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:zvOhP9tFnapFYwMYjKfzsA50Na6Ahdb8tYHm5iNzn6Q keith@linuxacademy.com
The key's randomart image is:
+---[RSA 2048]----+
|    +   +.       |
|   o + + Bo      |
|  . o + *.+.     |
|   . o O o  .  ..|
|    . = S    =...|
|     + O o  o.+  |
|      * O o  o.  |
|       E *.oo.   |
|        ..++.    |
+----[SHA256]-----+
```

We'll need to copy the contents of ~/.ssh/id_rsa.pub so that we can paste it into our data bag now.

**~/chef-repo/data_bags/users/user.json**

```
{
  "id": "user",
  "password": "$1$x2c/ZLCa$szcG5mRkPRXk9DuKgvUHb/",
  "uid": 1001,
  "groups": ["wheel", "dev"],
  "ssh_keys": [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDpJXZfTd6R5bOu6HHn87LmoLN1P1Soxb4uTtmNQs/Q8yUaCzEg+MUZTOJfGvjEUn1x8+zk+ugSwRLYdkynRFsPAyUmnPV9LW9uNgPQQsSnUnVlVnYVUpufp8kNOOlCOuOnfY32aD9qfdVMahwOlnkiGGBfee2YLeFVjhcacvqy1Dprsdw7L65snPEB31HCNg0pu9rF/vJV9ta94EadN5AwuO/ex8E/YgEI2XDwkJN2yhsumhyyM2ihnXu0/GTd7BkS5UuAonbjT/oNmS+MqqhBEZYYkIEDrobjRauDrfSGR9tbjGH5nTnF6aYD6PF/lmEi91xhKHbor5xwmf6q3XOf keith@linuxacademy.com"
  ]
}
```

Now we can create this item using the from file sub-command off of knife data bag.

```
[workstation] chef-repo $ knife data bag from file users data_bags/users/user.json
Updated data_bag_item[users::user]
```

Finally, we're ready to update our bcf_users cookbook to use this information.

### A Better Users Cookbook

Our first step to improving the bcf_users cookbook is to add a dependency to our metadata.rb.

**~/chef-repo/cookbooks/bcf_users/metadata.rb**

```
name 'bcf_users'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures users'
long_description 'Installs/Configures users'
version '1.0.0'
chef_version '>= 12.14' if respond_to?(:chef_version)

depends 'users', '~> 5.3.1'
Note: that we update the version in addition to adding the dependency.
```

Now we'll update our default recipe:

**~/chef-repo/cookbooks/bcf_users/recipes/default.rb**

```
users_manage "wheel"
users_manage "ci"
```

The users_manage will look for items in the users data bag matching the name specified and manage those users. Now we're ready to upload our modified cookbook, and since we have dependencies now we're going to use Berkshelf to also download the dependent cookbooks to the Chef Server.

```
[workstation] chef-repo $ cd cookbooks/bcf_users
[workstation] bcf_users $ berks install
[workstation] bcf_users $ berks upload
...
[workstation] bcf_users $ knife cookbook list
apache           0.1.0
bcf_essentials   0.1.0
bcf_motd         0.1.0
bcf_nginx        1.0.0
bcf_users        1.0.0
lcd_web          0.1.0
users            5.3.1
```

Finally, let's run chef-client on web-node1 to make sure that it works as expected.

```
[workstation] bcf_users $ knife ssh 'name:web-node1' 'sudo chef-client'
...
keiththomps3.mylabserver.com Chef Client finished, 9/20 resources updated in 07 seconds
```

Now we can use SSH to connect from our workstation to the node without using our user's password (we'll need to use the SSH keyphrase).

```
[workstation] bcf_users $ ssh user@keiththomps3.mylabserver.com
Enter passphrase for key '/home/user/.ssh/id_rsa':
Last login: Wed May 30 15:14:39 2018 from 172.31.120.31
IP Address: 172.31.29.208
Catch Phrase: Delivering in Staging
-sh-4.2$
```

As we can see, it changed our user's shell to be sh instead of bash. To fix this, we can update the data bag using knife and re-run chef-client on the node.

```
[workstation] bcf_users $ knife data bag edit users user
```

Here's what our final data bag item will look like.

```
{
  "name": "data_bag_item_users_user",
  "json_class": "Chef::DataBagItem",
  "chef_type": "data_bag_item",
  "data_bag": "users",
  "raw_data": {
    "id": "user",
    "password": "$1$x2c/ZLCa$szcG5mRkPRXk9DuKgvUHb/",
    "groups": [
      "wheel",
      "dev"
    ],
    "uid": 1001,
    "ssh_keys": [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDpJXZfTd6R5bOu6HHn87LmoLN1P1Soxb4uTtmNQs/Q8yUaCzEg+MUZTOJfGvjEUn1x8+zk+ugSwRLYdkynRFsPAyUmnPV9LW9uNgPQQsSnUnVlVnYVUpufp8kNOOlCOuOnfY32aD9qfdVMahwOlnkiGGBfee2YLeFVjhcacvqy1Dprsdw7L65snPEB31HCNg0pu9rF/vJV9ta94EadN5AwuO/ex8E/YgEI2XDwkJN2yhsumhyyM2ihnXu0/GTd7BkS5UuAonbjT/oNmS+MqqhBEZYYkIEDrobjRauDrfSGR9tbjGH5nTnF6aYD6PF/lmEi91xhKHbor5xwmf6q3XOf keith@linuxacademy.com"
    ],
    "shell": "/usr/bin/bash"
  }
}
```

Run chef-client one more time.

```
[workstation] bcf_users $ knife ssh 'name:web-node1' 'sudo chef-client'
...
```

Without making any changes to any recipes, node, environment, or role we were able to update our user's information on the node.

### Working with Data Bags in Recipes

If we ourselves wanted to use data bag information within a recipe we can use the data_bag and data_bag_item methods (see more here). Here's essentially what the users_manage resource does for us (for example using the admins data bag):

```
admins = data_bag('admins')

admins.each do |login|
  admin = data_bag_item('admins', login)
  home = "/home/#{login}"

  user(login) do
    uid       admin['uid']
    gid       admin['gid']
    shell     admin['shell']
    comment   admin['comment']
    home      home
    manage_home true
  end
end
```

### Expected deliverables
- Deliver a cookbook applying the test-repair approach.

### Evaluation

| Metric name | Description | % Value |
| ----------- |-------------| -------:|
| 01 - Understanding  | Clear Understanding of Each of the Chef Concepts | %25 |
| 02 - Architecture Idea   | Project and Code Structure / Designed | %25 |
| 03 - Collaboration   | Team Working and Integration | %25 |
| 04 - Functional   | It could be useful for an improvement | %25 |