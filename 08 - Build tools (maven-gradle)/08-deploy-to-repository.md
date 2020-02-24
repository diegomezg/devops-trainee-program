# Build Tools
# Deploy libraries to Repository

### Instructions
- Run Nexus in a docker container https://hub.docker.com/r/sonatype/nexus
- Configure the nexus plugin to the Java project https://www.baeldung.com/maven-deploy-nexus
- Run the command `./mvnw clean deploy`

### Expected deliverables
- code versioned in gitlab
- print screen of the project deployed in Nexus UI as SNAPSHOT
- print screen of the project deployed in Nexus UI as RELEASE


### Evaluation

| Metric name                          | Description                                                                              | % Value |
| ------------------------------------ | ---------------------------------------------------------------------------------------- | ------: |
| Environment variables in pom.xml     | Use environment variables for credentials                                                |      5% |
| Project registered in Nexus SNAPSHOT | You should use the maven phase: `deploy` to deploy the jar file in Nexus under Snapshots |     60% |
| Project registered in Nexus RELEASE  | You should use the maven phase: `deploy` to deploy the jar file in Nexus under Releases  |     35% |
