# Gitlab pipeline to build with gradle

### Instructions
- Create a new project in gitlab(import)
- When creating the project, select tab "Import project", then click on "git Repo by URL"
- Place the URL https://github.com/todorovc/gradle_base at field "Git repository URL" then click "Create project"
- Make the necessary to work with the repo locally by using `git remote set-url --add origin git@gitlab.com:$USER/$REPO.git`
- Pipeline should contain stages for:
  - build
  - test
  - deploy
- In ***build*** stage, build the project using the following command ```./gradlew build```
  - should allow execution from any branch
- In ***test*** stage, run Unit & Integration Tests using ```./gradlew clean test --no-daemon```
  - should allow execution from any branch
- In ***deploy*** stage, run Unit & Integration Tests using ```./gradlew clean test --no-daemon```
  - should allow execution only from master branch
  - should be allowed to fail
- Run(push commit) test with non-master branch
- Run(push commit) test with master branch
- Troubleshoot if issues


***Hints:*** 
use `image: java:8-jdk`
to save you troubleshooting time, it should contain the following within pipeline:
```
variables:
  GRADLE_USER_HOME: '.gradle-cache'
  
before_script:
  - export GRADLE_USER_HOME=`pwd`/.gradle
  - chmod +x ./gradlew

cache:
  paths:
    - .gradle/wrapper
    - .gradle/caches
```

### Expected deliverables
- MD file with screenshot from non-master branch 
- Documentation of procedures, include images if needed


### Evaluation

| Metric name        | Metric description                                | % Value |
|:------------------ |:--------------------------------------------------|:--:|
| MD format  | Clearity and completeness of their research | 40% |
| Content |  Was able to explain in his/her own words the concepts | 60% |
