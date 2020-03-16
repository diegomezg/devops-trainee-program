# Docker
## 01 – Pull Docker Image

Pull [Nginx](https://www.nginx.com) Image from Docker Repository
> What is [Nginx](https://www.nginx.com/resources/glossary/nginx/) ?
>
>  NGINX is open source software for web serving, reverse proxying, caching, load balancing, media streaming,
>  and more. ... In addition to its HTTP server capabilities, NGINX can also function as a proxy server for
>  email (IMAP, POP3, and SMTP) and a reverse proxy and load balancer for HTTP, TCP, and UDP servers

### Instructions

> PreRequisites
>
> Docker 19.X Installed or Docker id created and use the [DockerOnLine](https://labs.play-with-docker.com/) application
>

1. List the existing docker images in your docker host.

    ```
    docker images
    ```

2. Pull the ***latest*** version of [Nginx](https://www.nginx.com/resources/glossary/nginx/) image.
   ```
    docker pull nginx:latest
    ```
3. Pull the ***1.16*** version of [Nginx](https://www.nginx.com/resources/glossary/nginx/) image.
   ```
    docker pull nginx:1.16
    ```
4.  List the existing docker images in your docker host and observe that you have the latest and 1.16  version of Nginx
downloaded to your docker host

    ```
    docker images
    ```


You should be able to list your local images and the latest version of Nginx image should be displayed

```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
nginx               1.16                960143eb8965        3 days ago          127MB
nginx               latest              5ad3bd0e67a9        3 days ago          127MB
```

- Draw by your self a representation of the docker Architecture
- Explain the importance of Docker Hub into the Docker Architecture
- Provide an alternative solution to the use of Docker Hub
- Compare and analyze Docker Hub VS your alternative solution and identify the pros and cons
- Mention the docker commands involved to Docker Hub

### Expected deliverable
- MD file with each activity question answered
- Documentation of procedures, include images if needed

### Measuring instrument


| Metric  |  Description | Value  |
| ------------ | ------------ | ------------ |
|  Docker Architecture |  Drawed by your self the docker Architecture.  | 20%  |
|  Docker Hub and Architecture | Explained the importance of Docker Hub into the Docker Architecture.  |  20% |
|  Docker Hub | Provided an alternative solution to the use of Docker Hub.  |  20% |
|  Docker Hub | Compared and analyze Docker Hub VS your alternative solution and identify the pros and cons.  |  20% |
|  Docker Commands | Mentioned the docker commands involved to Docker Hub  |  20% |
