# Build Tools
# Deploy libraries to Artifactory Jfrog

### Instructions
- Run Artifactory in a docker container https://www.jfrog.com/confluence/display/RTF/Installing+with+Docker
- Configure the maven publish plugin to the Java project https://docs.gradle.org/6.0.1/userguide/publishing_maven.html
- Run the command `./gradlew clean build publish`

### Expected deliverables
- code versioned in gitlab
- print screen of the project deployed in Artifactory UI

### Evaluation

| Metric name                 | Description                                                                     | % Value |
| --------------------------- | ------------------------------------------------------------------------------- | ------: |
| Jar deployed in Artifactory | You should use the gradle task: `publish` to deploy the jar file in Artifactory |    100% |
