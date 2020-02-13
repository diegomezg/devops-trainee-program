# Docker
## 03 - Dockerfile
### Instructions

> PreRequisites
>
> Docker 19.X Installed or Docker id created and use the [DockerOnLine](https://labs.play-with-docker.com/) application
>


1. Create a new file named ***Dockerfile***


2. Edit the ***Dockerfile*** with the code below:
   ```
    FROM python:3
    WORKDIR /usr/src/app
    COPY . .
    CMD [ "python", "./test.py" ]
    ```

3. create a python ***test.py*** file with the below content:
   ```
    for i in range(0,10):
         print(i)
    ```

4.  Build a new image

    ```
    docker build -t test-python .
    ```

4.  Run the new image

    ```
    docker run test-python
    ```

You should be able to list your local images and the new just created image should be displayed:

```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
test-python         latest              d03e44cbb23b        2 hours ago         971MB

```

- Explain all the commands provided in dockerfile for this practice
- Explain What is the difference between RUN and CMD commands
- After Build, Where is the test.py file located into the container?
- Modify the Docker file to install python modules from requirements.txt file
- Create an alternative way to create this container (tip: .tar file)


##### Expected deliverable
- MD file with each activity question answered
- Documentation of procedures, include images if needed

##### Measuring instrument


| Metric  |  Description | Value  |
| ------------ | ------------ | ------------ |
|  Docker File Concepts | Explain all the commands provided in dockerfile for this practice.  | 20%  |
|  Docker File Concepts | Explain What is the difference between RUN and CMD commands.  |  5% |
|  Docker File Concepts | After Build, Where is the test.py file located into the container ?  |  5% |
|  Docker File Concepts | Modify the Docker file to install python modules from requirements.txt file  |  40% |
|  Docker File Concepts | Create an alternative way to create this container ( tip: .tar file)  |  30% |
