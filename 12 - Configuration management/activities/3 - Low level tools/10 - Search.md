# Chef

## 10 - Search

### Chef Server Search Indexes

When we used knife ssh we were implicitly searching through "nodes", but the Chef Server holds onto other indexes. We can search the following indexes:

- client
- node
- environment
- role
- DATA_BAG_NAME - Note: we'll use the actual name of the data bag, so we would search explicitly on our users data bag.

To search over any of these indexes we'll use knife search [index name] [query] [flags]. Here's an example using the users data bag since it's the most unique of the possible indexes:

```
[workstation] chef-repo $ knife search users 'groups:wheel'
1 items found

chef_type: data_bag_item
data_bag:  users
groups:
  wheel
  dev
id:        user
password:  $1$x2c/ZLCa$szcG5mRkPRXk9DuKgvUHb/
shell:     /usr/bin/bash
ssh_keys:  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDpJXZfTd6R5bOu6HHn87LmoLN1P1Soxb4uTtmNQs/Q8yUaCzEg+MUZTOJfGvjEUn1x8+zk+ugSwRLYdkynRFsPAyUmnPV9LW9uNgPQQsSnUnVlVnYVUpufp8kNOOlCOuOnfY32aD9qfdVMahwOlnkiGGBfee2YLeFVjhcacvqy1Dprsdw7L65snPEB31HCNg0pu9rF/vJV9ta94EadN5AwuO/ex8E/YgEI2XDwkJN2yhsumhyyM2ihnXu0/GTd7BkS5UuAonbjT/oNmS+MqqhBEZYYkIEDrobjRauDrfSGR9tbjGH5nTnF6aYD6PF/lmEi91xhKHbor5xwmf6q3XOf keith@linuxacademy.com
uid:       1001
```

### Chef Search Query Syntax

To fully leverage the power of search we need to understand how we can construct more complex queries and what information we can query on. The latter is fairly easy because we can query on any of the fields returned when we show the item (using something like knife node show web-node1. This information includes the extra fields that aren't shown by default (some node attributes are hidden unless we pass the --long flag).

The query takes the format of multiple key:search_pattern joined by AND, OR, and NOT. Both the key and the search_pattern can use the following pattern expressions:

- * - match 0 or more characters
- ? - match exactly 1 character
- [ TO ] - inclusive range (will return item matching the bound)
- { TO } - exclusive range (will not return item matching the bounds)

Here's a relatively complicated example searching nodes:

```
[workstation] chef-repo $ knife search node 'user-*:/root/Deskto? AND chef_environment:staging' -i
1 items found

web-node1
[workstation] chef-repo $ knife search node 'user-*:/root/Deskto? AND chef_environment:staging' -r
1 items found

web-node1:
  run_list:
    role[base]
    recipe[bcf_nginx]
```

We've used the -i flag to show only the node ID and also the -r flag to only return the run-list. Additionally, we could show the attributes that we want to see using the -a flag just like we can with the various knife [index] show commands. Let's see what matched on user-*:/root/Deskto?:

```
[workstation] chef-repo $ knife search node 'user-*:/root/Deskto? AND chef_environment:staging' --long | grep "user-.*/root/Deskto."
1 items found

  user-desktop:                 /root/Desktop
```

It looks like we had a user-desktop key in the extended list of attributes that matched our query. You may very well run into some odd situations when searching using knife. An example is when the key doesn't match what you expect. Trying to search for the environment:staging is one of those cases. Here are a few attempts and their results:

```
[workstation] chef-repo $ knife search node 'environment:staging' -i
0 items found

[workstation] chef-repo $ knife search node 'Environment:staging' -i
0 items found

[workstation] chef-repo $ knife search node 'chef_environment:staging' -i
1 items found

web-node1
Notice that it only found the node when we used the key chef_environment. The reason for this is that it searches based on the JSON formatted attributes, and there is not an environment or Environment key in the JSON output.

[workstation] chef-repo $ knife node show web-node1 -l | grep environment
[workstation] chef-repo $ knife node show web-node1 -l | grep Environment
Environment: staging
[workstation] chef-repo $ knife node show web-node1 -F json -l | grep Environment
[workstation] chef-repo $ knife node show web-node1 -F json -l | grep environment
  "chef_environment": "staging",
```

There are also range operators of [] and {} combined with the keyword TO that allow you to search on ranges, but these will require some experimentation to really understand and they're beyond the scope of this lesson.

### Utilizing Search in Recipes

Knowing how to search using knife is extremely useful, but we can also use this search within our recipes. To demonstrate how we can do this, we're going to add another resource to our bcf_nginx cookbook to have an HTML page outputting the available environments in our Chef Server. We'll add this right to the default recipe:

**~/chef-repo/cookbooks/bcf_nginx/recipes/default.rb (added to end of file)**

```
...
file_contents = "<ul>\n"

search('environment', 'name:*', filter_result: { 'output' => ['name'] }).each do |env|
  puts("******* ENVIRONMENT IS: #{env}*******")
  file_contents += "<li>#{env['output']}</li>\n"
end

file_contents += "</ul>"

file "/usr/share/nginx/html/environments.html" do
  content file_contents
end
```

The search method allows us to do the same thing that we are doing with knife search except it returns ruby objects to us. In this example, we're using the each method on the ruby array returned from search to iterate through each result. The filter_result argument is optional but allows us to specify the key we want in the result (output in this case) and the attribute from the environment object that we would like to be assigned to that key (name). Filtering the results down in this way prevents us from loading huge objects into memory (specifically useful for node objects).

Now we can update the cookbook and run chef-client:

```
[workstation] chef-repo $ knife upload cookbook cookbooks/bcf_nginx
Updated cookbooks/bcf_nginx
[workstation] chef-repo $ knife ssh 'name:web-node1' 'sudo chef-client'
...
keiththomps3.mylabserver.com Compiling Cookbooks...
keiththomps3.mylabserver.com ******* ENVIRONMENT IS: {"name"=>"_default"}*******
keiththomps3.mylabserver.com ******* ENVIRONMENT IS: {"name"=>"production"}*******
keiththomps3.mylabserver.com ******* ENVIRONMENT IS: {"name"=>"staging"}*******
...
keiththomps3.mylabserver.com     @@ -1 +1,6 @@
keiththomps3.mylabserver.com     +<ul>
keiththomps3.mylabserver.com     +<li>_default</li>
keiththomps3.mylabserver.com     +<li>production</li>
keiththomps3.mylabserver.com     +<li>staging</li>
keiththomps3.mylabserver.com     +</ul>
keiththomps3.mylabserver.com     - restore selinux security context
keiththomps3.mylabserver.com
keiththomps3.mylabserver.com Running handlers:
keiththomps3.mylabserver.com Running handlers complete
keiththomps3.mylabserver.com Chef Client finished, 1/21 resources updated in 22 seconds
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