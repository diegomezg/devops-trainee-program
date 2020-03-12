# Chef

## 05 - Run Lists Instructions

### Uploading Our Cookbook

Thus far, our bcf_nginx cookbook works on our workstation node, but we want to be able to run it on web-node1. For us to do this we need to do the following:

1. Upload bcf_nginx to the Chef Server.
2. Set the run-list of web-node1 to include our cookbook’s “default” recipe.
3. Run chef-client on web-node1.

We can carry out all of these steps without ever leaving our workstation’s terminal window by using the many subcommands provided to us by knife. Let’s start by adjusting our cookbook’s metadata and uploading the cookbook.

All of the cookbook’s metadata is stored in the metadata.rb file. Since this is the first version of this cookbook, we want to make sure that the version is set to 1.0.0:

**~/chef-repo/cookbooks/bcf_nginx/metadata.rb**
```
name 'bcf_nginx'
maintainer 'Your Name'
maintainer_email 'your_email@example.com'
license 'All Rights Reserved'
description 'Installs/Configures NGINX'
long_description 'Installs/Configures NGINX'
version '1.0.0'
chef_version '>= 12.14' if respond_to?(:chef_version)
```

We’ve removed some of the comments, but with this set up, we’re ready to upload. The command for uploading a cookbook to the Chef Server is knife upload [path/to/cookbook]. Let’s run this command to see what happens:

```
[workstation] $ knife upload cookbooks/bcf_nginx
Created cookbooks/bcf_nginx
```

That’s not a lot of output, but it looks like we did what we were trying to do.

### Setting a Run-List
Every node managed by Chef has a run-list that specifies the recipes to run and in what order. We can see the current run-list of web-node1 by using the knife node show command:

```
[workstation] $ knife node show web-node1
Node Name:   web-node1
Environment: _default
FQDN:        keiththomps3.mylabserver.com
IP:          34.214.123.141
Run List:
Roles:
Recipes:
Platform:    centos 7.4.1708
Tags:
```

As we can see, the "run_list" key is set to an empty array because there are no recipes to run. The two types of objects that can be added to the run-list are:
1. Recipes
2. Roles

Notice that “cookbooks” aren’t in the list. We can’t run cookbooks directly, instead we reference specific recipes from within the cookbooks by name. Let’s add the bcf_nginx “default” recipe to the web-node1 run-list:

```
[workstation] chef-repo $ knife node run_list add web-node1 'recipe[bcf_nginx::default]'
web-node1:
  run_list: recipe[bcf_nginx::default]
```

It’s worth noting that you can’t run a cookbook directly, but you can add it and knife will do the right thing. Let’s reset the run-list using knife node run_list set:

```
[workstation] chef-repo $ knife node run_list set web-node1 bcf_nginx
web-node1:
  run_list: recipe[bcf_nginx]
```

The recipe[bcf_nginx] statement is equivalent to the recipe[bcf_nginx::default] that we manually added earlier because the default recipe is run if nothing more specifically is referenced.

### Running the Chef-Client Remotely

With the run-list set, it’s time to run chef-client on the node to have it test-and-repair the configuration based on its current run-list. We’ll use the knife ssh command to find the machine and specify the command that should be run.

```
workstation] chef-repo $ knife ssh 'name:web-node1' 'sudo chef-client' -x user
user@keiththomps3.mylabserver.com's password:
keiththomps3.mylabserver.com knife sudo password:
Enter your password:
keiththomps3.mylabserver.com
keiththomps3.mylabserver.com Starting Chef Client, version 13.9.1
keiththomps3.mylabserver.com resolving cookbooks for run list: ["bcf_nginx::default"]
keiththomps3.mylabserver.com Synchronizing Cookbooks:
keiththomps3.mylabserver.com   - bcf_nginx (1.0.0)
keiththomps3.mylabserver.com Installing Cookbook Gems:
keiththomps3.mylabserver.com Compiling Cookbooks...
keiththomps3.mylabserver.com Converging 3 resources
keiththomps3.mylabserver.com Recipe: bcf_nginx::default
keiththomps3.mylabserver.com   * yum_package[nginx] action install
keiththomps3.mylabserver.com     - install version 1.12.2-2.el7 of package nginx
keiththomps3.mylabserver.com   * service[nginx] action enable
keiththomps3.mylabserver.com     - enable service service[nginx]
keiththomps3.mylabserver.com   * service[nginx] action start
keiththomps3.mylabserver.com     - start service service[nginx]
keiththomps3.mylabserver.com   * file[/usr/share/nginx/html/index.html] action create (skipped due to not_if)
keiththomps3.mylabserver.com
keiththomps3.mylabserver.com Running handlers:
keiththomps3.mylabserver.com Running handlers complete
keiththomps3.mylabserver.com Chef Client finished, 3/4 resources updated in 21 seconds
```

Breaking this command down, there are a few parts that are important:

1. The search: name:web-node1 - We can write a query here that can potentially return multiple nodes to us that we want to run the command on. We’ll learn more about this when we cover Chef’s searching capabilities.
2. The command: sudo chef-client - The command to run on the node.
3. The user as specified with the -x flag - This matches how we specified the user when we ran knife bootstrap. Since our workstation user is also named user we could leave this flag off.

We didn’t need to know the IP address or FQDN of the web-node1 because it’s stored in the Chef Server as part of the node object.

### Expected deliverables
- Deliver a cookbook applying the test-repair approach.

### Evaluation

| Metric name | Description | % Value |
| ----------- |-------------| -------:|
| 01 - Understanding  | Clear Understanding of Each of the Chef Concepts | %25 |
| 02 - Architecture Idea   | Project and Code Structure / Designed | %25 |
| 03 - Collaboration   | Team Working and Integration | %25 |
| 04 - Functional   | It could be useful for an improvement | %25 |
