# Chef

## Bootstrapping a Node with Knife and chef-client

### Bootstrapping a Node with knife
Before we can start working with Chef to manage configuration, we need to have a node to work with. To do this, we will create another new CentOS 7 cloud server. We will need to log into this server the first time so that we can reset the user password, but after that most of what we do will be done from our “workstation” server.

From our workstation, we’re going to use the knife utility and the bootstrap subcommand. Let’s take a look at the help text for this utility before we actually run it:

```
[workstation] $ knife bootstrap --help
knife bootstrap [SSH_USER@]FQDN (options)
...
```

We’ll see that there are a lot of available options, but thankfully, we don’t need to use too many of them. Since the cloud servers receive a new IP address after they’ve been restarted, we’re going to want to use one of the public domain names as the FQDN (Fully Qualified Domain Name). Besides that, we’ll need to specify which user to connect to the server as and how to run it. Let’s bootstrap our new cloud server to be a node managed by our Chef server:

```
[workstation] $ # knife bootstrap FQDN -N NODE_NAME -x USER -P PASSWORD --sudo
[workstation] $ knife bootstrap keiththomps3.mylabserver.com -N web-node1 -x user -P 'p@ssw0rd' --sudo
```

**Note: the flag for passing through the password is a capital P, the lowercase p flag sets the port, but that is a common mistake.**

This process installs the chef-client and associated software packages onto the node and also utilizes the information from our workstation to communicate with the Chef Server and register the node as both a “node” and a “client” of the Chef server. Additionally, the chef-client is run, fetching the configuration from the Chef server, but there currently isn’t anything there so the process only actually updates the Chef server with the information about the node.

## The chef-client Process

Before we move on, let’s talk about what happens when a chef-client run occurs. Here’s the process:

1. Get configuration data - Read information from client.rb file and Ohai attributes.
2. Authenticate w/ Chef server - Utilizes RSA key & node name to authenticate with Chef server. Will generate a new RSA key if this is the first connection.
3. Get/rebuild the node object - Pull node object from Chef server if this isn’t the first chef-client run. After the pull, the node object is rebuilt based on the node’s current state.
4. Expand the run-list - Compiles the list of roles and recipes to be applied.
5. Synchronize cookbooks - Request and download all of the files from cookbooks on the Chef server that are necessary to converge the run list and are different from the files already existing on the node.
6. Reset node attributes - Rebuild the attributes on the node object.
7. Compile the resource collection - Load the necessary Ruby code to converge the run-list.
8. Converge the node - Execute the run-list.
9. Update the node object, process exception & report handlers - Update the node object on the Chef server after the chef-client run finishes successfully. Also executing the exception and report handlers in the proper order.
10. Stop, wait for the next run - The chef-client waits until the next time it is executed.