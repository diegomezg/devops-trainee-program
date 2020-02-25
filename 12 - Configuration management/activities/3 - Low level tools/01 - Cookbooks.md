# Chef

## 01 - Cookbooks

### What is a cookbook?

A cookbook is a collection of smaller building blocks that make up a useful, shareable piece of configuration. In the words of the official Chef documentation:

A cookbook defines a scenario and contains everything that is required to support that scenario.

We’re going to learn about all of the smaller pieces that we’ll need to support a scenario as we continue through the course, but the first thing that we need is a cookbook to contain them.

### Generating a Cookbook

The Chef Development Kit includes a generate command that we’ve already seen can be used to create a chef-repo, but it can also be used to create the other types of structures that we’ll need to fully utilize Chef. That list includes cookbooks. Let’s use chef generate to create a cookbook that will handle the scenario of installing and configuring NGINX. All of our cookbooks are going to go in the cookbooks directory within our Chef repo and we’ll call this one bcf_nginx (For “Basic Chef Fluency”):

```
[workstation] ~/chef-repo $ chef generate cookbook cookbooks/bcf_nginx
Generating cookbook bcf_nginx
- Ensuring correct cookbook file content
- Ensuring delivery configuration
- Ensuring correct delivery build cookbook content

Your cookbook is ready. Type `cd cookbooks/bcf_nginx` to enter it.

There are several commands you can run to get started locally developing and testing your cookbook.
Type `delivery local --help` to see a full list.

Why not start by writing a test? Tests for the default recipe are stored at:

test/integration/default/default_test.rb

If you'd prefer to dive right in, the default recipe can be found at:

recipes/default.rb
```

Taking a look at this output we see some information about delivery, writing tests, and a default recipe. These are all topics that we’re going to cover as we continue on, but for right now we’re just going to worry about the structure of the cookbook that was generated. Let’s install the tree utility to our workstation and use it to get a high-level overview of what we’re working with:

```
[workstation chef-repo] $ sudo yum install -y tree
...
[workstation chef-repo] $ tree cookbooks/bcf_nginx/
cookbooks/bcf_nginx/
??? Berksfile
??? chefignore
??? .delivery
?   ??? build_cookbook
?   ?   ??? Berksfile
?   ?   ??? chefignore
?   ?   ??? data_bags
?   ?   ?   ??? keys
?   ?   ?       ??? delivery_builder_keys.json
?   ?   ??? .kitchen.yml
?   ?   ??? LICENSE
?   ?   ??? metadata.rb
?   ?   ??? README.md
?   ?   ??? recipes
?   ?   ?   ??? default.rb
?   ?   ?   ??? deploy.rb
?   ?   ?   ??? functional.rb
?   ?   ?   ??? lint.rb
?   ?   ?   ??? provision.rb
?   ?   ?   ??? publish.rb
?   ?   ?   ??? quality.rb
?   ?   ?   ??? security.rb
?   ?   ?   ??? smoke.rb
?   ?   ?   ??? syntax.rb
?   ?   ?   ??? unit.rb
?   ?   ??? secrets
?   ?   ?   ??? fakey-mcfakerton
?   ?   ??? test
?   ?       ??? fixtures
?   ?           ??? cookbooks
?   ?               ??? test
?   ?                   ??? metadata.rb
?   ?                   ??? recipes
?   ?                       ??? default.rb
?   ??? config.json
?   ??? project.toml
??? .kitchen.yml
??? LICENSE
??? metadata.rb
??? README.md
??? recipes
?   ??? default.rb
??? spec
?   ??? spec_helper.rb
?   ??? unit
?       ??? recipes
?           ??? default_spec.rb
??? test
    ??? integration
        ??? default
            ??? default_test.rb
```

Going through this list, here’s an overview of what each file is used for:

- Berksfile - Configuration file used by Berkshelf, which is the package manager for Chef. This allows us to define cookbook dependencies.
- chefignore - Specifies the files (can use patterns) that knife should ignore when uploading contents to the Chef Server.
- .delivery - Directory holding configuration related to using delivery when working with Chef Automate.
- .kitchen.yml - Configuration for kitchen to use for running integration tests.
- LICENSE - The license that this cookbooks code should use.
- metadata.rb - Includes information describing the cookbook itself. Information including compatible Chef versions, cookbook version number, name, email of maintainer, cookbook dependencies (Berkshelf uses this file also), and more.
- README.md - Documentation for the cookbook as a whole that usually includes usage information.
- recipes - Contains the cookbook recipes. Recipes are where the configuration happens in a cookbook.
- spec - Directory that “unit” tests will go in. These tests don’t require an entire server to be spun up to test them.
- test - Directory that higher level tests like “integration” tests will go in. These tests execute checks on a configured node.

In the next few lessons, we’ll look at more and more of the building blocks that we’ll use when working with Chef.

### Documentation for this lesson

- Chef cookbook documentation
- Berkshelf documentation
- delivery documentation
- kitchen documentation

### Expected deliverable
- MD file with each activity question answered
- Documentation of procedures, include images if needed

### Measuring instrument

| Metric  |  Description | Value  |
| ------------ | ------------ | ------------ |
|  Docker Architecture |  Drawed by your self the docker Architecture.  | 20%  |
|  Docker Hub and Architecture | Explained the importance of Docker Hub into the Docker Architecture.  |  20% |
|  Docker Hub | Provided an alternative solution to the use of Docker Hub.  |  20% |
|  Docker Hub | Compared and analyze Docker Hub VS your alternative solution and identify the pros and cons.  |  20% |
|  Docker Commands | Mentioned the docker commands involved to Docker Hub  |  20% |
