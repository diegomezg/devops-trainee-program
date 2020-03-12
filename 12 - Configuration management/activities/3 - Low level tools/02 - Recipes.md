# Chef
## 02 - Recipes Instructions

### The default Recipe

Every cookbook will come with a default recipe. We can have more than one recipe within a cookbook, but we will always have at least this one. Here’s what the default recipe for our bcf_nginx cookbook contains right now:

**~/chef-repo/cookbooks/bcf_nginx/recipes/default.rb**

```
#
# Cookbook:: bcf_nginx
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
```

All Chef code is written in Ruby. We don’t need to be ruby experts to use Chef thankfully, but it does help to understand the syntax, so as we go through this I’ll call out what’s going on in the ruby itself to hopefully provide more clarity.

For these existing lines, we’re seeing ruby comments and none of what we see here is executed.

**Installing NGINX**

**NOTE: Installing NGINX works here because the epel-release package is already installed on the Cloud Playground image that we're using. If there is an error saying that no package nginx could be found then it is most likely because the image in use (on a custom VM) does not have the EPEL repository enabled. Run yum install epel-release on the node before continuing.**

Our cookbook is going to install and configure the NGINX package, and one of the benefits of Chef is that we get to “declare” what we want to have the final configuration be and let Chef attempt to make that happen. To achieve this declarative approach, we won’t be writing the individual steps necessary to accomplish things, we’ll instead be leveraging Chef resources. We’ll dig deep into resources in a later lesson, but let’s use the first two right now: package and service:

**~/chef-repo/cookbooks/bcf_nginx/recipes/default.rb**

```
package "nginx"

service "nginx" do
  action [:enable, :start]
end
```

The package resource is in charge of installing the package with the name that we specify. Based on the system that is running the recipe, a different package manager will be used. The package abstracting away the implementation, we don’t have to necessarily worry about whether it is using yum on Red Hat based systems or apt-get on debian based systems.

Similarly, the service package will allow us to run the service without specifying directly if you should use systemd or something else.

These are both “resources”, but when we used service we added the do ... end so that we could modify the default action of the resource. By default, the service resource will only :start the service, so upon reboot, the service won’t start automatically. The do ... end is a ruby “block” and gives us a context to modify the configuration of the resource.

### Running the Recipe Locally
Eventually, we’ll start utilizing kitchen for automated testing as we develop our cookbook, but for right now we’ll run this locally to see how it works.

To run any recipe, we need to use the chef-client binary. Normally, chef-client interacts with a Chef Server to know what to run, but there are options that we can pass to it to run it locally using [chef_zero][6] (an in-memory Chef Server). Let’s run our recipe to see if it installs NGINX like we expect:

```
[workstation chef-repo] $ sudo chef-client --local-mode cookbooks/bcf_nginx/recipes/default.rb
...
[2018-04-30T17:59:27+00:00] INFO: Chef Run complete in 8.674367561 seconds

Running handlers:
[2018-04-30T17:59:27+00:00] INFO: Running report handlers
Running handlers complete
[2018-04-30T17:59:27+00:00] INFO: Report handlers complete
Chef Client finished, 3/3 resources updated in 10 seconds
```

If we manually check the status of the NGINX service using systemctl we should see that it is both running and enabled.

```
[workstation chef-repo] $ systemctl status nginx
? nginx.service - The nginx HTTP and reverse proxy server
   Loaded: loaded (/usr/lib/systemd/system/nginx.service; enabled; vendor preset: disabled)
   Active: active (running) since Mon 2018-04-30 17:59:27 UTC; 8s ago
  Process: 3546 ExecStart=/usr/sbin/nginx (code=exited, status=0/SUCCESS)
  Process: 3544 ExecStartPre=/usr/sbin/nginx -t (code=exited, status=0/SUCCESS)
  Process: 3542 ExecStartPre=/usr/bin/rm -f /run/nginx.pid (code=exited, status=0/SUCCESS)
 Main PID: 3549 (nginx)
    Tasks: 2
   Memory: 6.6M
   CGroup: /system.slice/nginx.service
           ??3549 nginx: master process /usr/sbin/nginx
           ??3550 nginx: worker process

Apr 30 17:59:27 keiththomps1.mylabserver.com systemd[1]: Starting The nginx HTTP and reverse proxy server...
Apr 30 17:59:27 keiththomps1.mylabserver.com nginx[3544]: nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
Apr 30 17:59:27 keiththomps1.mylabserver.com nginx[3544]: nginx: configuration file /etc/nginx/nginx.conf test is successful
Apr 30 17:59:27 keiththomps1.mylabserver.com systemd[1]: Failed to read PID from file /run/nginx.pid: Invalid argument
Apr 30 17:59:27 keiththomps1.mylabserver.com systemd[1]: Started The nginx HTTP and reverse proxy server.
```

In just a few lines, we were able to install, start, and enable the NGINX service.

### Re-running a Recipe

What happens if we run chef-client with this recipe again? Let’s find out.

```
[workstation chef-repo] $ sudo chef-client --local-mode cookbooks/bcf_nginx/recipes/default.rb
...
Converging 2 resources
Recipe: @recipe_files::/home/user/chef-repo/cookbooks/bcf_nginx/recipes/default.rb
  * yum_package[nginx] action install[2018-04-30T18:23:50+00:00] INFO: Processing yum_package[nginx] action install (@recipe_files::/home/user/chef-repo/cookbooks/bcf_nginx/recipes/default.rb line 7)
 (up to date)
  * service[nginx] action enable[2018-04-30T18:23:54+00:00] INFO: Processing service[nginx] action enable (@recipe_files::/home/user/chef-repo/cookbooks/bcf_nginx/recipes/default.rb line 9)
 (up to date)
  * service[nginx] action start[2018-04-30T18:23:54+00:00] INFO: Processing service[nginx] action start (@recipe_files::/home/user/chef-repo/cookbooks/bcf_nginx/recipes/default.rb line 9)
 (up to date)
[2018-04-30T18:23:54+00:00] INFO: Chef Run complete in 4.279274025 seconds

Running handlers:
[2018-04-30T18:23:54+00:00] INFO: Running report handlers
Running handlers complete
[2018-04-30T18:23:54+00:00] INFO: Report handlers complete
Chef Client finished, 0/3 resources updated in 06 seconds
```

Because Chef uses a “test and repair” approach, running the same recipe multiple times is idempotent (no changes made after the first time). Let’s manually disable the service before running chef-client one last time.

```
[workstation chef-repo] $ sudo systemctl disable nginx
[workstation chef-repo] $ sudo chef-client --local-mode cookbooks/bcf_nginx/recipes/default.rb
...
Converging 2 resources
Recipe: @recipe_files::/home/user/chef-repo/cookbooks/bcf_nginx/recipes/default.rb
  * yum_package[nginx] action install[2018-04-30T18:27:46+00:00] INFO: Processing yum_package[nginx] action install (@recipe_files::/home/user/chef-repo/cookbooks/bcf_nginx/recipes/default.rb line 7)
 (up to date)
  * service[nginx] action enable[2018-04-30T18:27:50+00:00] INFO: Processing service[nginx] action enable (@recipe_files::/home/user/chef-repo/cookbooks/bcf_nginx/recipes/default.rb line 9)
[2018-04-30T18:27:50+00:00] INFO: service[nginx] enabled

- enable service service[nginx]

service[nginx] action start[2018-04-30T18:27:50+00:00] INFO: Processing service[nginx] action start (@recipe_files::/home/user/chef-repo/cookbooks/bcf_nginx/recipes/default.rb line 9)
(up to date)
[2018-04-30T18:27:50+00:00] INFO: Chef Run complete in 4.467122259 seconds

Running handlers:
[2018-04-30T18:27:50+00:00] INFO: Running report handlers
Running handlers complete
[2018-04-30T18:27:50+00:00] INFO: Report handlers complete
Chef Client finished, 1/3 resources updated in 06 seconds
```

Since the service was not enabled, an action was taken to enable it. This change was the only modification Chef needed to make to get the system back to the desired state.

### Expected deliverables
- Deliver a cookbook applying the test-repair approach.

### Evaluation

| Metric name | Description | % Value |
| ----------- |-------------| -------:|
| 01 - Understanding  | Clear Understanding of Each of the Chef Concepts | %25 |
| 02 - Architecture Idea   | Project and Code Structure / Designed | %25 |
| 03 - Collaboration   | Team Working and Integration | %25 |
| 04 - Functional   | It could be useful for an improvement | %25 |