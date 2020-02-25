# Chef

## 06 - Roles

### What is a Role?

Officially, a role is “a way to define certain patterns and processes that exist across nodes in an organization as belonging to a single job function”. A simple way to think of this is that a role is a repeatable, named run-list that can also define shared attributes. Say we want to create a group of users on every server and install some universal tools (for instance vim).

Let’s create a few more cookbooks that can be responsible for these things and then create a role called “base” that we can add to each node.

### Creating Additional Cookbooks

We’ll create two more cookbooks:

1. bcf_essentials - Install essential tools like vim.
2. bcf_users - Create users.
3. We’ve named both of these cookbooks with bcf_ because all cookbooks need to be uniquely named and it’s a common practice to prefix custom cookbooks with your company or project name. For this course we’re using bcf_ for “basic chef fluency”, and this prefix will prevent our cookbooks from colliding with any potential third-party cookbooks that we might use.

Let’s create our cookbooks now:

```
[workstation] chef-repo $ chef generate cookbook cookbooks/bcf_essentials
...
[workstation] chef-repo $ chef generate cookbook cookbooks/bcf_users
...
```

While our focus is on building up a role for ourselves, we’re going to learn more about writing cookbooks in the process.

### Building the bcf_essentials Cookbook

The bcf_essentials cookbook is a fairly generic cookbook that will be in charge of installing and configuring some of our universal software. As you can imagine, there might be quite a few different tools that we want to install and configure, and this is a great opportunity for us to be able to separate these out into self-contained recipes. Let’s create a recipe specifically to install and configure vim by create a new recipe file at **~/chef-repo/cookbooks/bcf_essentials/recipes/vim.rb:**

```
[workstation] chef-repo $ chef generate recipe cookbooks/bcf_essentials vim
Recipe: code_generator::recipe
  * directory[cookbooks/bcf_essentials/spec/unit/recipes] action create (up to date)
  * cookbook_file[cookbooks/bcf_essentials/spec/spec_helper.rb] action create_if_missing (up to date)
  * template[cookbooks/bcf_essentials/spec/unit/recipes/vim_spec.rb] action create_if_missing
    - create new file cookbooks/bcf_essentials/spec/unit/recipes/vim_spec.rb
    - update content in file cookbooks/bcf_essentials/spec/unit/recipes/vim_spec.rb from none to d735c7
    (diff output suppressed by config)
    - restore selinux security context
  * directory[cookbooks/bcf_essentials/test/integration/default] action create (up to date)
  * template[cookbooks/bcf_essentials/test/integration/default/vim_test.rb] action create_if_missing
    - create new file cookbooks/bcf_essentials/test/integration/default/vim_test.rb
    - update content in file cookbooks/bcf_essentials/test/integration/default/vim_test.rb from none to d31e16
    (diff output suppressed by config)
    - restore selinux security context
  * template[cookbooks/bcf_essentials/recipes/vim.rb] action create
    - create new file cookbooks/bcf_essentials/recipes/vim.rb
    - update content in file cookbooks/bcf_essentials/recipes/vim.rb from none to f015cf
    (diff output suppressed by config)
    - restore selinux security context
```

**~/chef-repo/cookbooks/bcf_essentials/recipes/vim.rb**

```
package "vim"

cookbook_file "/etc/vimrc" do
  source "default/vimrc"
end
```

The first thing that we do is install vim using the package resource that we’ve used before. Next, we create a custom, global vim configuration file. The cookbook_file resource is new to us, but it allows us to package up default files in a separate files directory within our cookbook so that we don’t have to specify the content within the ruby code. Let’s create this file now:

```
[workstation] chef-repo $ chef generate file cookbooks/bcf_essentials vimrc
Recipe: code_generator::cookbook_file
  * directory[cookbooks/bcf_essentials/files/default] action create
    - create new directory cookbooks/bcf_essentials/files/default
    - restore selinux security context
  * template[cookbooks/bcf_essentials/files/default/vimrc] action create
    - create new file cookbooks/bcf_essentials/files/default/vimrc
    - update content in file cookbooks/bcf_essentials/files/default/vimrc from none to e3b0c4
    (diff output suppressed by config)
    - restore selinux security context
```

Using the chef generate command again we’re able to ensure that we’re structuring our cookbook in an idiomatic way. Let’s now put some configuration into this file:

**~/chef-repo/cookbooks/bcf_essentials/files/default/vimrc**

```
set nocompatible

filetype off
filetype plugin indent on

syntax on

set number
set autoindent
set backspace=indent,eol,start
set noswapfile
```

This recipe is actually something that we might like to use on our workstation, so let’s run it to make sure that it works:

```
[workstation] chef-repo $ sudo chef-client --local-mode -o 'recipe[bcf_essentials::vim]'
[2018-05-16T15:57:43+00:00] INFO: Started chef-zero at chefzero://localhost:1 with repository at /home/user/chef-repo
  One version per cookbook

[2018-05-16T15:57:43+00:00] INFO: Forking chef instance to converge...
Starting Chef Client, version 13.8.5
[2018-05-16T15:57:43+00:00] INFO: *** Chef 13.8.5 ***
[2018-05-16T15:57:43+00:00] INFO: Platform: x86_64-linux
[2018-05-16T15:57:43+00:00] INFO: Chef-client pid: 4064
[2018-05-16T15:57:43+00:00] INFO: The plugin path /etc/chef/ohai/plugins does not exist. Skipping...
[2018-05-16T15:57:45+00:00] WARN: Run List override has been provided.
[2018-05-16T15:57:45+00:00] WARN: Original Run List: []
[2018-05-16T15:57:45+00:00] WARN: Overridden Run List: [recipe[bcf_essentials::vim]]
[2018-05-16T15:57:45+00:00] INFO: Run List is [recipe[bcf_essentials::vim]]
[2018-05-16T15:57:45+00:00] INFO: Run List expands to [bcf_essentials::vim]
[2018-05-16T15:57:45+00:00] INFO: Starting Chef Run for keith
[2018-05-16T15:57:45+00:00] INFO: Running start handlers
[2018-05-16T15:57:45+00:00] INFO: Start handlers complete.
resolving cookbooks for run list: ["bcf_essentials::vim"]
[2018-05-16T15:57:45+00:00] INFO: Loading cookbooks [bcf_essentials@0.1.0]
[2018-05-16T15:57:45+00:00] INFO: Skipping removal of obsoleted cookbooks from the cache
Synchronizing Cookbooks:
[2018-05-16T15:57:45+00:00] INFO: Storing updated cookbooks/bcf_essentials/files/default/vimrc in the cache.
  - bcf_essentials (0.1.0)
Installing Cookbook Gems:
Compiling Cookbooks...
Converging 2 resources
Recipe: bcf_essentials::vim
  * yum_package[vim] action install[2018-05-16T15:57:45+00:00] INFO: Processing yum_package[vim] action install (bcf_essentials::vim line 1)
 (up to date)
  * cookbook_file[/etc/vimrc] action create[2018-05-16T15:57:49+00:00] INFO: Processing cookbook_file[/etc/vimrc] action create (bcf_essentials::vim
line 3)
[2018-05-16T15:57:49+00:00] INFO: cookbook_file[/etc/vimrc] created file /etc/vimrc

    - create new file /etc/vimrc[2018-05-16T15:57:49+00:00] INFO: cookbook_file[/etc/vimrc] updated file contents /etc/vimrc

    - update content in file /etc/vimrc from none to a27d89
    --- /etc/vimrc      2018-05-16 15:57:49.819814503 +0000
    +++ /etc/.chef-vimrc20180516-4064-1icj7in   2018-05-16 15:57:49.819814503 +0000
    @@ -1 +1,11 @@
    +set nocompatible
    +filetype off
    +filetype plugin indent on
    +
    +syntax on
    +
    +set number
    +set autoindent
    +set backspace=indent,eol,start
    +set noswapfile
    - restore selinux security context
[2018-05-16T15:57:49+00:00] WARN: Skipping final node save because override_runlist was given
[2018-05-16T15:57:49+00:00] INFO: Chef Run complete in 4.181165517 seconds
[2018-05-16T15:57:49+00:00] INFO: Skipping removal of unused files from the cache

Running handlers:
[2018-05-16T15:57:49+00:00] INFO: Running report handlers
Running handlers complete
[2018-05-16T15:57:49+00:00] INFO: Report handlers complete
Chef Client finished, 1/2 resources updated in 06 seconds
```

Notice that we referenced the individual recipe from within the cookbook by combining the cookbook name and recipe name using ::. The last thing that we want to do is ensure that this recipe is run when the default recipe is run. We can do this by using include_recipe:

**~/chef-repo/cookbooks/bcf_essentials/recipes/default.rb**

```
include_recipe "bcf_essentials::vim"
```

We can use this approach to break a large cookbook into multiple, discrete recipes that we can use individually or combine.

### Creating the bcf_users Cookbook

We’re only going to define a default recipe for the bcf_users cookbook, but we’ll use a new resource, the user resource. Here’s what we get:

**~/chef-repo/cookbooks/bcf_users/recipes/default.rb**

```
user "jenkins" do
  comment "a user for CI/CD"
  password "secure_password"
end
```

Hardcoding the password into the recipe is bad, but we’ll fix this later after we’ve learned about data bags.

### Creating a Role

With our new cookbooks defined, let’s create a role that we can use to install our “essentials” and create the CI/CD user:

```
[workstation] chef-repo $ knife role create base
ERROR: RuntimeError: Please set EDITOR environment variable. See https://docs.chef.io/knife_setup.html for details.
```
We’re receiving an error because knife wants to open our editor with a file for us to edit and it will upload the results when we save and exit. Let’s set this environment variable in ~/.bash_profile so that it’s always set from now on (substitute vim with your preferred editor):

```
[workstation] echo 'export EDITOR=vim' >> ~/.bash_profile
[workstation] export EDITOR=vim
```

Now we’re ready to create our base role:

```
[workstation] chef-repo $ knife role create base
```

Here’s the file that we’re presented with:

```
{
  "name": "base",
  "description": "",
  "json_class": "Chef::Role",
  "default_attributes": {

  },
  "override_attributes": {

  },
  "chef_type": "role",
  "run_list": [

  ],
  "env_run_lists": {

  }
}
```

For now, we’re going to fill out the run_list key to include recipe[bcf_essentials] and recipe[bcf_users]. This is what it will look like before we save and exit:

```
{
  "name": "base",
  "description": "Sets up the essential tools and users. Should be used by all nodes.",
  "json_class": "Chef::Role",
  "default_attributes": {

  },
  "override_attributes": {

  },
  "chef_type": "role",
  "run_list": [
    "recipe[bcf_essentials]",
    "recipe[bcf_users]"
  ],
  "env_run_lists": {

  }
}
```

When we save and exit we’ll see that the role was saved. Just like the node object type, we have access to the CRUD actions for role through knife role. Let’s take a look at our existing roles:

```
[workstation] chef-repo $ knife role list
base
[workstation] chef-repo $ knife role show base
chef_type:           role
default_attributes:
description:         Sets up the essential tools and users. Should be used by all nodes.
env_run_lists:
json_class:          Chef::Role
name:                base
override_attributes:
run_list:
  recipe[bcf_essentials]
  recipe[bcf_users]
```

### Assigning a Role to a Node

When we looked at run-lists we mentioned that you could list recipes and roles. Let’s add our role to the run-list for web-node1, making sure that it’s the first item in the run-list:

```
[workstation] chef-repo $ knife node run_list add web-node1 'role[base]' --before 'recipe[bcf_nginx]'
web-node1:
  run_list:
    role[base]
    recipe[bcf_nginx]
```

Finally, we need to upload our new cookbooks and run chef-client on our node again for the recipes in our role to be run:

```
[workstation] chef-repo $ knife upload cookbooks/bcf_essentials cookbooks/bcf_users
Created cookbooks/bcf_essentials
Created cookbooks/bcf_users
[workstation] chef-repo $ knife ssh 'name:web-node1' 'sudo chef-client'
user@keiththomps3.mylabserver.com's password:
keiththomps3.mylabserver.com knife sudo password:
Enter your password:
keiththomps3.mylabserver.com
keiththomps3.mylabserver.com Starting Chef Client, version 13.9.1
keiththomps3.mylabserver.com resolving cookbooks for run list: ["bcf_essentials", "bcf_users", "bcf_nginx"]
keiththomps3.mylabserver.com Synchronizing Cookbooks:
keiththomps3.mylabserver.com   - bcf_essentials (0.1.0)
keiththomps3.mylabserver.com   - bcf_nginx (1.0.0)
keiththomps3.mylabserver.com   - bcf_users (0.1.0)
keiththomps3.mylabserver.com Installing Cookbook Gems:
keiththomps3.mylabserver.com Compiling Cookbooks...
keiththomps3.mylabserver.com Converging 6 resources
keiththomps3.mylabserver.com Recipe: bcf_essentials::vim
keiththomps3.mylabserver.com   * yum_package[vim] action install (up to date)
keiththomps3.mylabserver.com   * cookbook_file[/etc/vimrc] action create
keiththomps3.mylabserver.com     - update content in file /etc/vimrc from e6de2b to 948a24
keiththomps3.mylabserver.com     (current file is binary, diff output suppressed)
keiththomps3.mylabserver.com     - restore selinux security context
keiththomps3.mylabserver.com Recipe: bcf_users::default
keiththomps3.mylabserver.com   * linux_user[jenkins] action create
keiththomps3.mylabserver.com     - create user jenkins
keiththomps3.mylabserver.com Recipe: bcf_nginx::default
keiththomps3.mylabserver.com   * yum_package[nginx] action install (up to date)
keiththomps3.mylabserver.com   * service[nginx] action enable (up to date)
keiththomps3.mylabserver.com   * service[nginx] action start (up to date)
keiththomps3.mylabserver.com   * file[/usr/share/nginx/html/index.html] action create (skipped due to not_if)
keiththomps3.mylabserver.com
keiththomps3.mylabserver.com Running handlers:
keiththomps3.mylabserver.com Running handlers complete
keiththomps3.mylabserver.com Chef Client finished, 2/7 resources updated in 09 seconds
```

### Documentation for this lesson

- Chef role documentation