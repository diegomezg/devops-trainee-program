# Chef

## 03 - Resources Instructions

### Default Resource Actions

In our bcf_nginx default recipe we use the package resource without specifying the action, and this works because there is a default action. What is the default action of the package resource? If we look at the package’s “Actions” documentation we can see the options and that the default is :install. There are other options, let’s take a look at those now:

- :install - Default, installs the package.
- :nothing - Does nothing until the resource is notified.
- :purge - Debian specific, use :remove otherwise. Removes package and configuration.
- :reconfig - Reconfigure the package. Requires a response file.
- :remove - Removes the package.
- :upgrade - Install and/or ensure that the package is the latest version.

A few things to note here are that the :enable and :start actions that we used with the service resource aren’t here. Each resource defines its own actions. Notice that they are all present tense verbs (except for :nothing, it’s a unique one). Lastly, the :nothing action is shared by all resource types to allow us to specify what to do when a resource is “notified”.

Common Resource Characteristics.
All resources share some common characteristics and those can be found on a special page in the Chef documentation. We’ve already talked about the :nothing action that is shared, but there are other aspects that we’ll find that all resources have in common. Let’s discuss and demonstrate a few of these common characteristics now.

In addition to the :nothing action, every resource has access to the “guards” not_if and only_if. These guards allow us to specify whether or not the resource should execute based on the result of a conditional action or command. Let’s use not_if to only create an index.html file is one doesn’t exist using the file resource.

**~/chef-repo/cookbooks/bcf_nginx/recipes/default.rb**

```
package "nginx"

service "nginx" do
  action [:enable, :start]
end

file "/usr/share/nginx/html/index.html" do
  content "<h1>Hello, world!</h1>"
  action :create
  not_if { ::File.exists?("/usr/share/nginx/html/index.html") }
end
```

Let’s run this locally to see what happens (from ~/chef-repo):

```
[workstation] $ sudo chef-client --local-mode cookbooks/bcf_nginx/recipes/default.rb
...
  * file[/usr/share/nginx/html/index.html] action create[2018-05-14T18:41:10+00:00] INFO: Processing file[/usr/share/nginx/html/index.html] action create (@recipe_files::/home/user/chef-repo/cookbooks/bcf_nginx/recipes/default.rb line 7)
 (skipped due to not_if)
[2018-05-14T18:41:10+00:00] INFO: Chef Run complete in 4.938577518 seconds
```

This file already exists (because it was created by the nginx package), so nothing happened. Let’s delete this file and run it again.

```
[workstation] $ sudo rm /usr/share/nginx/html/index.html
[workstation] $ sudo chef-client --local-mode cookbooks/bcf_nginx/recipes/default.rb
...
    - create new file /usr/share/nginx/html/index.html[2018-05-14T18:46:01+00:00] INFO: file[/usr/share/nginx/html/index.html] updated file contents /usr/share/nginx/html/index.html

    - update content in file /usr/share/nginx/html/index.html from none to 17d291
    --- /usr/share/nginx/html/index.html        2018-05-14 18:46:01.183156913 +0000
    +++ /usr/share/nginx/html/.chef-index20180514-32741-1y8c6a6.html    2018-05-14 18:46:01.168157010 +0000
    @@ -1 +1,2 @@
    +<h1>Hello, world!</h1>
    - restore selinux security context
[2018-05-14T18:46:01+00:00] INFO: Chef Run complete in 5.796235169 seconds
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