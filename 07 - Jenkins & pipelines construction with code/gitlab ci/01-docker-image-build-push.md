# Gitlab pipeline to build and push images to docker hub

### Instructions

1. Create a new project in gitlab named ***docker-hub-ci*** (or whatever you want to name it)
2. Follow the instructions to start working with that repository in your local environment
3. Create a `Dockerfile`, it can be any of your own or one from internet such:
   1. https://github.com/nginxinc/docker-nginx/blob/master/stable/alpine/Dockerfile
4. Create a new file named `.gitlab-ci.yaml` 
5. Add the following to the file and make sure you replace ${USER} and ${IMAGE_NAME} according your information :
```
image: docker:18.09.7

services:
  - docker:18.09.7-dind

variables:
  LATEST_VER: ${USER}/${IMAGE_NAME}:latest

stages:
  - Build image
  - Push to Docker Hub

build:
  stage: Build image
  script:
  - docker info
  - docker build -t $LATEST_VER  .
  - docker image ls
  - echo "$REGISTRY_PASSWORD" | docker login -u "$REGISTRY_USER" --password-stdin
  - docker image ls
  - docker push $LATEST_VER && docker image rm $LATEST_VER

push:
  stage: Push to Docker Hub
  only:
  - master
  script:
  - echo "$REGISTRY_PASSWORD" | docker login -u "$REGISTRY_USER" --password-stdin
  - docker image ls
  - docker push $LATEST_VER && docker image rm $LATEST_VER
  when: manual
```
1. On the left menu go to Settings -> CICD -> Variables(Expand)
   1. Add `REGISTRY_PASSWORD` and add your password as the value
   2. Add `REGISTRY_USER` and add your docker hub user as the value
2. Commit your changes and push to master
3. Validate pipeline completes successfully and the image is now available at docker hub



### Expected deliverables

MD file containing URL to the successful job and URL to docker hub where the new image is available


### Evaluation

| Metric name | Description | % Value |
| ----------- |-------------| -------:|
| Pipeline  | Successful pipeline completion| %50 |
| Artifact    | Image available at docker hub   | %30 |
| Understanding   | Clear understanding of | %20 |
