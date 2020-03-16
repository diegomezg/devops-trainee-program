# Docker
## 02 - Create a Nginx Container

### Instructions

> PreRequisites
>
> - Docker 19.X Installed or Docker id created and use the [DockerOnLine](https://labs.play-with-docker.com/) application
> - Make sure you have completed Activity [01 - Pull Nginx Image](./01-Pull-Image.md)
>

Follow along this guide to run nginx inside a container:
1. List the existing docker containers running in your docker host, no Nginx containers are running:

    ```
    $ docker ps

    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    ```

2. Create/run a container for the ***latest*** version of [Nginx](https://www.nginx.com/resources/glossary/nginx/) image.
   ```
    $ docker run -d  nginx

   62b83c2d48d41dd53c3576474139d8a95bd6f8cb9d8306fca4d3d3719c054904
    ```
   > - This command is providing you a Docker Container ID for your running image.
   > - Please note we are not giving any label, as it takes the latest version as default.

3. Create/run a container for the ***1.16*** version of [Nginx](https://www.nginx.com/resources/glossary/nginx/) image.
   ```
   $ docker run -d nginx:1.16

   c9dfed92b445369d8e1f75dc6271439b232cc371d5d011ce963d2a2abd07900b
    ```
   > - This command is providing you a Docker Container ID for your running image.
   > - Please note this time we are specifying the version to be used.

4.  List the existing docker containers running in your docker host,
    you should see two containers running one for latest and one more for 1.16 versions

    ```
    $ docker ps

    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
    c9dfed92b445        nginx:1.16          "nginx -g 'daemon of…"   4 seconds ago       Up 4 seconds        80/tcp              objective_hodgkin
    62b83c2d48d4        nginx               "nginx -g 'daemon of…"   5 minutes ago       Up 5 minutes        80/tcp              adoring_faraday
    ```

    > - The field ***Name*** is created aleatory however you can assign a named if needed.

5.  Create a Docker container from Nginx version ***1.15*** which is not downloaded to your local images
    and additionally assign a custom name:  

    ```
    ---> A)  Make sure Nginx 1.15 is not in your local images

                $ docker images

                REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
                nginx               1.16                960143eb8965        3 days ago          127MB
                nginx               latest              5ad3bd0e67a9        3 days ago          127MB

    ---> B) Create docker container for Nginx 1.15 which is not present in your local images repository.

            $ docker run -d --name This-is-my-custom-long-name nginx:1.15

            Unable to find image 'nginx:1.15' locally
            1.15: Pulling from library/nginx
            743f2d6c1f65: Pull complete
            6bfc4ec4420a: Pull complete
            688a776db95f: Pull complete
            Digest: sha256:23b4dcdf0d34d4a129755fc6f52e1c6e23bb34ea011b315d87e193033bcd1b68
            Status: Downloaded newer image for nginx:1.15
            0367446c99ec57332a68b5f728d24f78f708b81d55d72f4bf39fdd3c0cd14660

            > - Please note the first line in the output ***Unable to find image 'nginx:1.15' locally***
            >   docker has downloaded the image to your local repository for you and then it has created the container

    ---> C) List the running containers and note the changes for ***Name*** and ***TAG***

            $ docker ps -a

            CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
            0367446c99ec        nginx:1.15          "nginx -g 'daemon of…"   11 seconds ago      Up 10 seconds       80/tcp              This-is-my-custom-long-name
            c9dfed92b445        nginx:1.16          "nginx -g 'daemon of…"   15 minutes ago      Up 15 minutes       80/tcp              objective_hodgkin
            62b83c2d48d4        nginx               "nginx -g 'daemon of…"   20 minutes ago      Up 20 minutes       80/tcp              adoring_faraday
    ```

- Explain the importance of use tags for images
- What is the meaning of ***latest*** tag ?
- Explain how to remove an specific image version
- Create a sequence of commands to remove all the images except latest (Using Bash or patterns or any other solution)

### Expected deliverable

-   Create 3 containers for 3 different versions of Nginx one of them with a custom name.
```
 $ docker ps -a

    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
    0367446c99ec        nginx:1.15          "nginx -g 'daemon of…"   11 seconds ago      Up 10 seconds       80/tcp              This-is-my-custom-long-name
    c9dfed92b445        nginx:1.16          "nginx -g 'daemon of…"   15 minutes ago      Up 15 minutes       80/tcp              objective_hodgkin
    62b83c2d48d4        nginx               "nginx -g 'daemon of…"   20 minutes ago      Up 20 minutes       80/tcp              adoring_faraday

```
- MD file with each activity question answered
- Documentation of procedures, include images if needed

### Measuring instrument


| Metric  |  Description | Value  |
| ------------ | ------------ | ------------ |
|  Docker Concepts | Explained the importance of use tags for images.  | 25%  |
|  Docker Concepts | Explained what is the meaning of ***latest*** tag  |  25% |
|  Use of docker commands | Explained how to remove an specific image version  |  25% |
|  Use of docker commands | Created a sequence of commands to remove all the images except latest (Using Bash or patterns or any other solution).  |  25% |
