# Chef

## 04 - Nodes

### What is a Node?

When we speak about a “node” in Chef there are two things that we can be talking about:

1. The “node” object that is stored on the Chef Server
2. The device (server, virtual machine, router, etc.) managed using chef-client

The “node” object is a collection of all of the information about the node that was reported to the Chef Server. This object is rebuilt on the device when chef-client is run and then updated in the Chef Server. The presence of this object allows us to read the information about a server in our infrastructure without connecting to it by using knife.

### Interacting with Node Information

The “node” object is the first of the data types that are indexed by the Chef Server, and with it, we get access to CRUD (Create, Read, Update, Delete) commands from knife. Here are the “node” commands that we have access to through knife:

```
[workstation] chef-repo $ knife node
FATAL: Cannot find subcommand for: 'node'
Available node subcommands: (for details, knife SUB-COMMAND --help)

** NODE COMMANDS **
knife node bulk delete REGEX (options)
knife node create NODE (options)
knife node delete [NODE [NODE]] (options)
knife node edit NODE (options)
knife node environment set NODE ENVIRONMENT
knife node from file FILE (options)
knife node list (options)
knife node run_list add [NODE] [ENTRY [ENTRY]] (options)
knife node run_list remove [NODE] [ENTRY [ENTRY]] (options)
knife node run_list set NODE ENTRIES (options)
knife node show NODE (options)
knife node status [<node> <node> ...]
```

To read the information, we can use knife node show NODE using our node name (web-node1):

```
[workstation] chef-repo $ knife node show web-node1
Node Name:   web-node1
Environment: _default
FQDN:        keiththomps3.mylabserver.com
IP:          54.187.81.221
Run List:
Roles:
Recipes:
Platform:    centos 7.5.1804
Tags:
```

This information is returned as YAML, but we do have the option to receive it as JSON, and we can also get all of the information using a few flags:

Note: truncated results (there’s a lot of information here)

```
[workstation] chef-repo $ knife node show -F json -l web-node1
{
  "name": "web-node1",
  "chef_environment": "_default",
  "run_list": [

]
,
  "normal": {
    "tags": [

    ]
  },
  "default": {

  },
  "override": {

  },
  "automatic": {
    "cpu": {
      "0": {
        "vendor_id": "GenuineIntel",
        "family": "6",
        "model": "63",
        "model_name": "Intel(R) Xeon(R) CPU E5-2676 v3 @ 2.40GHz",
        "stepping": "2",
        "mhz": "2400.075",
        "cache_size": "30720 KB",
        "physical_id": "0",
        "core_id": "0",
        ...
```

### Updating the Node Object

Using cloud servers, we’re in a good spot to see how the node object will be updated when chef-client has run. When a cloud server is stopped and started again, it will have a new public IP that upon running chef-client will be visible when we run knife node show NODE again.

### Documentation for this lesson 

- Chef node documentation
- knife node documentation

        