# Chef

## 08 - Attributes

### What is an Attribute?

Attributes are variable pieces of data that are associated with a node or set when a recipe is run. These attributes can be used to within recipes to change how resources are applied.

### The Types of Attributes
Attributes are a little more complicated than some of the aspects of Chef that we've looked at thus far because there are multiple ways that they can be set and they have different levels of precedence. Here's the order of precedence and where each attribute type is set.

1. default - Attributes automatically set during the chef-client run.
2. force_default - Attribute type guaranteed to override default values. Set in cookbooks.
3. normal - Attribute type that persists with the node object at the end of a chef-client run.
4. override - Attribute type reset at the start of a chef-client run. Used in cookbooks, roles, and environments. Limit use in cookbooks unless it can't be avoided.
5. force_override - Attribute type used by cookbooks to have precedence over override attributes.
6. automatic - Attribute type determined by Ohai at the start of the chef-client run. Can't be overridden.

In addition to there being multiple types/levels of attributes, there are numerous ways for attributes to be set.

1. By the Node (collected by Ohai, on chef-client run)
2. Attribute files (in cookbooks)
3. Recipes (in cookbooks)
4. Environments
5. Roles

### Reading Attributes

To dig into attributes, we're going to create a "Message of the Day" cookbook (called bcf_motd) and gradually see how we can read and write attributes. Let's generate our cookbook first:

```
[workstation] chef-repo $ chef generate cookbook cookbooks/bcf_motd
[workstation] chef-repo $ cd cookbooks/bcf_motd
```

We're going to use a single resource for the time being within our default recipe that populates the /etc/motd file with some information.

**~/chef-repo/cookbooks/bcf_motd/recipes/default.rb**

```
file "/etc/motd" do
  content "IP Address: #{node['ipaddress']}
Catch Phrase: #{node['catch_phrase']}
"
end
```

There are a few new things here:

1. The #{node['ipaddress']} is an example of string interpolation in Ruby which allows us to exercise some Ruby code within the #{...} and have that value written into the output string. One thing to note is that the string must use double-quotes (") for this feature to work.
2. We're interacting with the node object, which is a key-value pair object that we can read information from.

Let's run our recipe on our workstation, and see what we actually write out to the /etc/motd file.

```
[workstation] bcf_motd $ sudo chef-client --local-mode -r 'recipe[bcf_motd]'
...
[workstation] chef-repo $ cat /etc/motd
IP Address: 172.31.120.31
Catch Phrase:
```

The node object is built up during the chef-client run, and the ipaddress value is one of the values determined by Ohai. The catch_phrase attribute is not set at all, so nothing is put into the file, but no error occurs. The ipaddress attribute is one of the "automatic" attributes.

### Setting Attributes

We know the ways that attributes can be set, but let's see them in action. To start, let's manually set the catch_phrase and ipaddress attributes within our recipe:

**~/chef-repo/cookbooks/bcf_motd/recipes/default.rb**

```
node.force_override['ipaddress'] = '127.0.0.1'
node.normal['catch_phrase'] = 'Welcome to the kitchen'
node.force_default['catch_phrase'] = 'Cooking with Gas!'

file "/etc/motd" do
  content "
IP Address: #{node['ipaddress']}
Catch Phrase: #{node['catch_phrase']}
"
end
```

Now we'll run this recipe locally yet again:

```
[workstation] bcf_motd $ sudo chef-client --local-mode -r 'recipe[bcf_motd]'
...
[workstation] bcf_motd $ cat /etc/motd

IP Address: 172.31.120.31
Catch Phrase: Welcome to the kitchen
```

Notice that the IP address didn't change because the ipaddress attribute is an "automatic" attribute. Additionally, even though we would have set the catch_phrase to "Cooking with Gas!" after we set it to "Welcome to the kitchen" it wasn' changed because normal has precedence over force_default.

### Using an Attributes Files

Another way that we're able to set attributes is through attributes files in our cookbooks. Let's generate one now and move our attribute settings into that file:

Note: We're currently in the bcf_motd directory so the path of . will work.

```
[workstation] bcf_motd $ chef generate attribute . default
Recipe: code_generator::attribute
  * directory[././attributes] action create
    - create new directory ././attributes
    - restore selinux security context
  * template[././attributes/default.rb] action create
    - create new file ././attributes/default.rb
    - update content in file ././attributes/default.rb from none to e3b0c4
    (diff output suppressed by config)
    - restore selinux security context
```

**~/chef-repo/cookbooks/bcf_motd/attributes/default.rb**

```
node.normal['catch_phrase'] = 'Welcome to the kitchen'
node.force_default['catch_phrase'] = 'Cooking with Gas!'
```

We'll also remove setting those attributes from the recipe:

**~/chef-repo/cookbooks/bcf_motd/recipes/default.rb**

```
file "/etc/motd" do
  content "IP Address: #{node['ipaddress']}
Catch Phrase: #{node['catch_phrase']}
"
end
```

Running chef-client once again, we should see no changes because we only moved where we were setting these values.

```
[workstation] bcf_motd $ sudo chef-client --local-mode -r 'recipe[bcf_motd]'
...
Chef Client finished, 0/1 resources updated in 02 seconds
```

### Setting Attributes in Roles/Environments/Node Objects

We've looked at the nodes, roles, and environments up to this point, and we know that we can edit them as JSON using knife [type] edit -F json [item_name], but we've never set attributes. How do we set attributes using JSON? To see this in action we're going to need to use the Chef server, so we need to run our cookbook on a node. To accomplish this we'll need to do the following:

1. Upload our cookbook.
2. Add it to the base role.
3. Edit our staging environment attributes.
4. Run chef-client on the node.

We already know how to do most of this so, the output is abbreviated:

```
[workstation] bcf_motd $ cd ../../
[workstation] chef-repo $ knife upload cookbook cookbooks/bcf_motd
Created cookbooks/bcf_motd
[workstation] chef-repo $ knife role run_list add base 'bcf_motd'
chef_type:           role
default_attributes:
description:         Sets up the essential tools and users. Should be used by all nodes.
env_run_lists:
json_class:          Chef::Role
name:                base
override_attributes:
  catch_phrase: Cooking with Gas!
run_list:
  recipe[bcf_essentials]
  recipe[bcf_users]
  recipe[bcf_motd]
[workstation] chef-repo $ knife environment edit -F json staging
Saved staging
```

Here's the contents of our updated staging environment's JSON:

```
{
  "name": "staging",
  "description": "Pre-production, staging environment for internal access only.",
  "cookbook_versions": {

  },
  "json_class": "Chef::Environment",
  "chef_type": "environment",
  "default_attributes": {

  },
  "override_attributes": {
    "catch_phrase": "Delivering in Staging"
  }
}
```

We can expect that since this is set as an override attribute that it should be used instead of the force_default set in our cookbook. Let's run chef-client now:

```
[workstation] chef-repo $ knife ssh 'name:web-node1' 'sudo chef-client'
...
keiththomps3.mylabserver.com Chef Client finished, 1/8 resources updated in 07 seconds
```

Finally, we need to see what is in the /etc/motd file:

```
[workstation] chef-repo $ knife ssh 'name:web-node1' 'cat /etc/motd'
user@keiththomps3.mylabserver.com's password:
keiththomps3.mylabserver.com IP Address: 172.31.29.208
keiththomps3.mylabserver.com Catch Phrase: Delivering in Staging

The attribute precedence can get a little complicated, so try to use the lowest precedence that you can in cookbooks so that the values can be tuned for more fine-grained sections of your infrastructure.

### Documentation for this lesson

- The Chef attribute documentation
- Ohai
```