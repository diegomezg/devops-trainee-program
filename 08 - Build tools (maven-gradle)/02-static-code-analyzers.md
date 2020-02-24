# Build Tools
# 02 - Static code analyzers

### Instructions
- Run SonarQube in a docker container https://hub.docker.com/_/sonarqube/
- Configure the sonar plugin to the Java project
- Run the command `./mvnw clean verify`

### Expected deliverables
- code versioned in gitlab
- print screen of the project registered in Sonar UI


### Evaluation

| Metric name                      | Description                                                            | % Value |
| -------------------------------- | ---------------------------------------------------------------------- | ------: |
| Environment variables in pom.xml | Use environment variables for sonar url and credentials                |      5% |
| Project registered in Sonar      | You should use the maven phase: `verify` to send the analysis to Sonar |     95% |
