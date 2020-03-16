# Docker
## 05 - Docker compose

Use Docker compose to start python Flask app and Nginx at same time.

### Instructions

> PreRequisites
>
> Docker 19.X Installed or Docker id created and use the [DockerOnLine](https://labs.play-with-docker.com/) application
>


1. Create a new file named ***flask-example.py***
    ```
        from flask import Flask

        app = Flask(__name__)

        @app.route("/")
        def hello():
            return "Hello World!"


        if __name__ == "__main__":
            app.run('0.0.0.0')
    ```
2. Create a new file named ***dockerfile***
     ```
    FROM python:3
    WORKDIR /usr/src/app
    RUN pip install Flask
    COPY . .
    CMD [ "python", "./flask-example.py" ]
    ```

3. Create a new file named ***docker-compose.yml***
   ```
    version: '3'
    services:
        flask-example:
            restart: always
            build:
              dockerfile: dockerfile
              context: .
            ports:
              - '81:5000'
        web:
            image: nginx
            ports:
              - '80:80'

    ```

4. Run the below command in order to create/build  and run images:
   ```
    docker-compose up --build -d
    ```

5.  Display Images:

    ```
    docker-compose images
    ```
5.  Display current running containers:

    ```
    docker ps -a
    docker-compose ps
    ```

- What are the benefits to use docker compose ?
- Explain the docker compose file and the commands/directives used in this example
- Investigate and explain what is the use of --scale option

### Expected deliverable

Two containers running using docker compose:

```
$ docker-compose ps
         Name                       Command              State          Ports        
-------------------------------------------------------------------------------------
root_container-killer_1   python ./container-killer.py   Up      0.0.0.0:81->5000/tcp
root_web_1                nginx -g daemon off;           Up      0.0.0.0:80->80/tcp  

```
- MD file with each activity question answered
- Documentation of procedures, include images if needed

### Measuring instrument 


| Metric  |  Description | Value  |
| ------------ | ------------ | ------------ |
|  Docker Compose Concepts | Mentioned the benefits to use docker compose | 40%  |
|  Use of docker compose commands | Explained˜ the docker compose file and the commands/directives used in this example  |  30% |
|  Use of docker compose commands | Investigated and explain what is the use of --scale option  |  30% |
