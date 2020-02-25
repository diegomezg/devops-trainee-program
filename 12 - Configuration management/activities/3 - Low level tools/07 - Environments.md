# Chef

## 07 - Environments

### Creating an Environment

Many of the most common “environments” that we use in DevOps are development, staging, production, and qa, and it’s useful to also group our infrastructure into this groups. Thankfully, Chef Server has a way for us to create environments that map to our own workflows and assign them to our infrastructure how we please. Let’s create a few environments now using knife environment create

```
[workstation] chef-repo $ knife environment create staging --description 'Pre-production, staging environment for internal access only.'
```

This will drop us into a JSON like the following:

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

  }
}
```

Notice that there’s an option here for us to specify cookbook versions. This capability allows us to lock down versions so that we don’t accidentally deploy a cookbook version that’s not quite ready for production to our production environment. For now, we’ll save the file to create the environment without any cookbook version specification.

Let’s create one more for production (immediately saving the file that is generated):

```
[workstation] chef-repo $ knife environment create production --description 'Production environment'
```

Now we have a few different environments in the Chef Server that we can work with.

```
[workstation] chef-repo $ knife environment list
_default
staging
production
```

What’s this _default environment? Every organization in the Chef server begins with this environment and it can’t be deleted. This environment is necessary because every node must belong to an environment. If we look at our existing node we’ll see that it currently belongs to this environment:

```
[workstation] chef-repo $ knife node show web-node1 -a environment
web-node1:
  environment: _default
```

Note: we’ve used the -a flag with knife node show so that we only get the environment attribute back.

Let’s assign this node to the staging environment using knife node environment_set:

```
[workstation] chef-repo $ knife node environment_set web-node1 staging
web-node1:
  chef_environment: staging
```

Now if we use knife node show we should see that the node is part of the staging environment:

```
[workstation] chef-repo $ knife node show web-node1 -a environment
web-node1:
  environment: staging
```

### Documentation for this lesson

- Chef environments documentation
- knife environment documentation