# Build Tools
# 03 - Code Coverage

### Instructions
1. Copy the code created from Activity 1 into [activities/03-code-coverage](./activities/03-code-coverage)
1. Add the JaCoCo dependency to the pom (https://www.eclemma.org/jacoco/trunk/doc/maven.html)
1. Configure JaCoCo to 90% code coverage.
1. Configure JaCoco to break the build if the coverage is less than 90%
1. Modify the `Greeter.java` class 
1. Add a new method called `sayHelloTo` that will receive an String as parameter. This method must return the following string: `Hi, {name}. Hello world! {}` Where name is the value of the String parameter.
1. Modify the main method to add the call to `sayHelloTo` method the name parameter value should be obtained from the args array
1. Add the proper unit test cases to have at least 90% code coverage

### Expected deliverables
- The code should be placed under [activities/03-code-coverage](./activities/03-code-coverage)
- Screen shot of a successful build with the minimum of 90% code coverage
- Generate a jar file and push it to the repo


### Evaluation

| Metric name | Description | % Value |
| ----------- |-------------| -------:|
|  Working Executable Jar file pushed to the repo | Upload a Jar file that can be executed and accepts the input params  | 10% |
|  The unit test class is well defined and it has proper assertions  | Use jUnit 4 for the test cases and assertions | 10% |
|  The build should pass  | Upload an screenshot of the build passing | 80% |
