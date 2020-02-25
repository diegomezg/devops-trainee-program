# Chef

## 11 - Notifications

### Specifying a Notification

Finding a use for notifications isn't hard because it's pretty common for us to need to restart a service based on a configuration change. This isn't something that we want to happen every time so we instead want to hook into specific events in Chef using "notifications". Just like the guards not_if and only_if, the notification methods of notifies and subscribes are universally available and they're two ways of potentially accomplishing the same thing. Let's temporarily modify our bcf_nginx default recipe to send the :reload action to the service[nginx] resource when a configuration file is changed.

**~/chef-repo/cookbooks/bcf_nginx/recipes/default.rb**

```
package "nginx"

service "nginx" do
  action [:enable, :start]
  subscribes :reload, 'file[/etc/nginx/example.conf]'
end

file "/usr/share/nginx/html/index.html" do
  content "<h1>Hello, world!</h1>"
  action :create
  not_if { ::File.exists?("/usr/share/nginx/html/index.html") }
end
```


We're relying on there being a resource call file[/etc/nginx/example.conf], so what happens if we run this before there is one? WHen we run chef-client we see the following:

```
[workstation] chef-repo $ knife upload cookbooks/bcf_nginx
...
[workstation] chef-repo $ knife ssh 'name:web-node1' 'sudo chef-client'
...
keiththompson3.mylabserver.com Recipe: bcf_nginx::default
keiththompson3.mylabserver.com   * yum_package[nginx] action install (up to date)
keiththompson3.mylabserver.com   * service[nginx] action enable (up to date)
keiththompson3.mylabserver.com   * service[nginx] action start (up to date)
keiththompson3.mylabserver.com   * file[/usr/share/nginx/html/index.html] action create (skipped due to not_if)
keiththompson3.mylabserver.com
keiththompson3.mylabserver.com Running handlers:
keiththompson3.mylabserver.com Running handlers complete
keiththompson3.mylabserver.com Chef Client finished, 0/4 resources updated in 06 seconds
```

There is not an error because although the resource doesn't exist in our recipe that doesn't mean that it won't exist in some recipe. Let's go ahead add the resource that would trigger the notification:

**~/chef-repo/cookbooks/bcf_nginx/recipes/default.rb**

```
package "nginx"

service "nginx" do
  action [:enable, :start]
  subscribes :reload, 'file[/etc/nginx/example.conf]'
end

file "/usr/share/nginx/html/index.html" do
  content "<h1>Hello, world!</h1>"
  action :create
  not_if { ::File.exists?("/usr/share/nginx/html/index.html") }
end

file "/etc/nginx/example.conf" do
  content "example content"
end
```

Let's upload and run this again:

```
[workstation] chef-repo $ knife upload cookbooks/bcf_nginx
...
[workstation] chef-repo $ knife ssh 'name:web-node1' 'sudo chef-client'
...
keiththompson3.mylabserver.com Recipe: bcf_nginx::default
keiththompson3.mylabserver.com   * yum_package[nginx] action install (up to date)
keiththompson3.mylabserver.com   * service[nginx] action enable (up to date)
keiththompson3.mylabserver.com   * service[nginx] action start (up to date)
keiththompson3.mylabserver.com   * file[/usr/share/nginx/html/index.html] action create (skipped due to not_if)
keiththompson3.mylabserver.com   * file[/etc/nginx/example.conf] action create
keiththompson3.mylabserver.com     - create new file /etc/nginx/example.conf
keiththompson3.mylabserver.com     - update content in file /etc/nginx/example.conf from none to a2dee4
keiththompson3.mylabserver.com     --- /etc/nginx/example.conf    2018-07-30 20:52:30.112291753 +0000
keiththompson3.mylabserver.com     +++ /etc/nginx/.chef-example20180730-3719-1or29qk.conf    2018-07-30 20:52:30.112291753 +0000
keiththompson3.mylabserver.com     @@ -1 +1,2 @@
keiththompson3.mylabserver.com     +example content
keiththompson3.mylabserver.com     - restore selinux security context
keiththompson3.mylabserver.com   * service[nginx] action reload
keiththompson3.mylabserver.com     - reload service service[nginx]
keiththompson3.mylabserver.com
keiththompson3.mylabserver.com Running handlers:
keiththompson3.mylabserver.com Running handlers complete
keiththompson3.mylabserver.com Chef Client finished, 2/6 resources updated in 06 seconds
```

This time around we can see that the file[/etc/nginx/example.conf] resource ran and then because it ran, the service[nginx] resource received the :reload action. If we wanted to achieve the same result using the notifies notification we would instead put the logic in the file[/etc/nginx/example.conf] resource like this:

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

file "/etc/nginx/example.conf" do
  content "example content updated"
  notifies :reload, 'service[nginx]'
end
```

If we upload and run chef-client one last time we can see that it would yield effectively the same result:

```
[workstation] chef-repo $ knife upload cookbooks/bcf_nginx
...
[workstation] chef-repo $ knife ssh 'name:web-node1' 'sudo chef-client'
...
keiththompson3.mylabserver.com Recipe: bcf_nginx::default
keiththompson3.mylabserver.com   * yum_package[nginx] action install (up to date)
keiththompson3.mylabserver.com   * service[nginx] action enable (up to date)
keiththompson3.mylabserver.com   * service[nginx] action start (up to date)
keiththompson3.mylabserver.com   * file[/usr/share/nginx/html/index.html] action create (skipped due to not_if)
keiththompson3.mylabserver.com   * file[/etc/nginx/example.conf] action create
keiththompson3.mylabserver.com     - update content in file /etc/nginx/example.conf from a2dee4 to 4d6640
keiththompson3.mylabserver.com     --- /etc/nginx/example.conf    2018-07-30 20:52:30.112291753 +0000
keiththompson3.mylabserver.com     +++ /etc/nginx/.chef-example20180730-4167-1h1devn.conf    2018-07-30 20:57:13.019647612 +0000
keiththompson3.mylabserver.com     @@ -1,2 +1,2 @@
keiththompson3.mylabserver.com     -example content
keiththompson3.mylabserver.com     +example content updated
keiththompson3.mylabserver.com     - restore selinux security context
keiththompson3.mylabserver.com   * service[nginx] action reload
keiththompson3.mylabserver.com     - reload service service[nginx]
keiththompson3.mylabserver.com
keiththompson3.mylabserver.com Running handlers:
keiththompson3.mylabserver.com Running handlers complete
keiththompson3.mylabserver.com Chef Client finished, 2/6 resources updated in 06 seconds
```

For the purpose of this course, we're not going to use these notifications in this recipe, so let's revert the recipe before continuing:

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

Don't forget to upload the cookbook again:

```
[workstation] chef-repo $ knife upload cookbooks/bcf_nginx
```

### Understanding Timers

Both notification types take an optional timer argument. The options are:

- :delayed - Default. Waits until the end of the Chef-Client run to execute the action.
- :immediately - Runs the notification right away.
- :before - Runs the notified action before the notifier. For notifies it will run the argument to the notification first instead of the defining resource. For subscribes it will run the defining resources before the resources that it is subscribing to.

### Documentation for this lesson

- Notifications
- The notifies notification
- The subscribes notification