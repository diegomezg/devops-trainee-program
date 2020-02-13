# Docker Commands
	
## Docker CLI

### Container Related Commands

#### Run a container in interactive mode

```
Run a bash shell inside an image

$ docker run -it centos bash

Check the release inside a container

$ cat /etc/redhat-release
CentOS Linux release 8.1.1911 (Core) 
```
#### Run a container in detached mode:
```
$ docker run --name mywildfly -d -p 8080:8080 jboss/wildfly
```
#### Run a detached container in a previously created container network:
```
$ docker network create mynetwork
$ docker run --name mywildfly-net -d --net mynetwork -p 8080:8080 jboss/wildfly
```
#### Run a detached container mounting a local folder inside the container:
```
$ docker run --name mywildfly-volume -d -v myfolder/:/opt/jboss/wildfly/standalone/deployments -p 8080:8080 jboss/wildflyjboss/wildfly
```
#### Follow the logs of a specific container:
```
$ docker logs -f mywildfly
$ docker logs -f [container-name|container-id]
```
#### List containers:
```
 List only active containers

$ docker ps

 List all containers

$ docker ps -a
```
#### Stop a container:
```
Stop a container

$ docker stop [container-name|container-id]

Stop a container (timeout = 1 second)

$ docker stop -t1
```
#### Remove a container:
```
Remove a stopped container

$ docker rm [container-name|container-id]

Force stop and remove a container

$ docker rm -f [container-name|container-id]

 Remove all containers

$ docker rm -f $(docker ps -aq)

 Remove all stopped containers

$ docker rm $(docker ps -q -f "status=exited")
```
#### Execute a new process in an existing container:
```
Execute and access bash inside a WildFly container

$ docker exec -it mywildfly bash
```
---

| Command       | Description                      |
| ------------------ | -------------------------------- |
|daemon  | Run the persistent process that manages containers|
|attach  |  Attach to a running container to view its ongoing output or to control it interactively|
|commit  |  Create a new image from a container’s changes|
|cp      |  Copy files/folders between a container and the local filesystem|
|create  |  Create a new container|
|dif f   |  Inspect changes on a container’s filesystem|
|exec    |  Run a command in a running container|
|export  |  Export the contents of a container’s filesystem as a tar archive|
|kill    |  Kill a running container using SIGKILL or a specified signal|
|logs    |  Fetch the logs of a container|
|pause   |  Pause all processes within a container|
|port    |  List port mappings, or look up the public-facing port that is NAT-ed to the PRIVATE_PORT|
|ps      |  List containers|
|rename  |  Rename a container|
|restart |  Restart a container|
|rm      |  Remove one or more containers|
|run     |  Run a command in a new container|
|start   |  Start one or more containers|
|stats   |  Display one or more containers’ resource usage statistics|
|stop    |  Stop a container by sending SIGTERM then SIGKILL after a grace period|
|top     |  Display the running processes of a container|
|unpause |  Unpause all processes within a container|
|update  |  Update configuration of one or more containers|
|wait    |  Block until a container stops, then print its exit code|

--- 

