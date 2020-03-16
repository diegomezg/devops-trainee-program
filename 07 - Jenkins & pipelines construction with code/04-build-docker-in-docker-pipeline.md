# Jenkins & Pipelines Construction with Code
# Build a CI CD pipeline using a docker in Docker slave Agent

### Instructions
- Using the activity 2  exercise Project, create a fork of this project https://github.com/linuxacademy/cicd-pipeline-train-schedule-pipelines
- Create and push a jenkins slave agent dockerfile to the forked repo with the name of dockerfile.slave
- Create a dockerfile to run the builded project, please use COPY to push the artifactory to the docker
- Create a new Pipeline project in Jenkins
- Define the agent using the dockerfile functions and use the dockerfile.slave as agent (https://jenkins.io/doc/book/pipeline/syntax/) 
- Build the project using the following command ```./gradlew build```
- Build the project dockerfile and push it to a free registry
- Deploy the project builded image from the Registry and expose the 3000 port


### Expected deliverables
- MD file with procedure and Architecture Diagrams
- Share the registry URL with the builded image


### Evaluation

| Metric name        | Metric description                                | % Value |
|:------------------ |:--------------------------------------------------|:--:|
| MD format  | Clearity and completeness  procedure and Architecture Diagrams| 20% |
| Docker Image | Docker Registry url with working image | 20% |
| Content |  Was able to explain in his/her the pipeline and the Docker in docker concept | 60% |
