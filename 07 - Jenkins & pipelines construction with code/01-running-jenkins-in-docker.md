# Jenkins & Pipelines Construction with Code
# Downloading and running Jenkins in Docker

### Instructions
- Open up a terminal window.
- Create a bridge network in Docker using the following docker network create command: ```docker network create jenkins```
- Create the following volumes to share the Docker client TLS certificates needed to connect to the Docker daemon and persist the Jenkins data using the following docker volume create commands: 

     ```
     docker volume create jenkins-docker-certs
     docker volume create jenkins-data 
     ```
- In order to execute Docker commands inside Jenkins nodes, download and run the docker:dind Docker image using the following docker container run command:
     
     ```
     docker container run --name jenkins-docker --rm --detach \
        --privileged --network jenkins --network-alias docker \
        --env DOCKER_TLS_CERTDIR=/certs \
        --volume jenkins-docker-certs:/certs/client \
        --volume jenkins-data:/var/jenkins_home \
        --publish 2376:2376 docker:dind
    ```
- Download the jenkinsci/blueocean image and run it as a container in Docker using the following docker container run command:
     
     ```
     docker container run --name jenkins-blueocean --rm --detach \
        --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
        --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
        --volume jenkins-data:/var/jenkins_home \
        --volume jenkins-docker-certs:/certs/client:ro \
        --publish 8080:8080 --publish 50000:50000 jenkinsci/blueocean
    ```
- Proceed to the Post-installation setup wizard.


### Expected deliverables
- Improve Jenkins setup running in Docker adding at least a worker, you can consolidate all the setup using a docker-compose file
- MD file with each activity
- Documentation of procedures, include images if needed



### Evaluation

| Metric name | Description | % Value |
| ----------- |-------------| -------:|
| Architectural adherence  | Create a better solution to run Jenkins on Docker container | %40 |
| Functional    | It could be useful for an improvement   | %30 |
| Integration with other tools   | The improvement must be able to integrate new tools easily | %20 |
