# Docker
## 06 - Build tf+aws image and upload to docker hub

Build a Dockerfile to create an image containing aws cli + terraform and upload to docker hub.

### Instructions

1. Create a new file named ***Dockerfile***
2. Research and troubleshoot if any issue to accomplish the following:
   1. Install latests aws cli and its dependencies
   2. Install terraform 12 binary
   3. Build the Dockerfile to create an image
3. Create an account at hub.docker.com
4. Create a repository in your account
5. At your terminal login to docker hub 
6. Tag the image and upload the image to your repo

### Expected deliverable
- MR containing Docker file and URL to dockerhub where image can be pulled.

### Measuring instrument


| Metric  |  Description | Value  |
| ------------ | ------------ | ------------ |
|  aws cli dependency | Installed aws cli from scratch  | 30%  |
|  terraform 12| Installed terraform 12 from scratch  | 30%  |
|  docker hub | image available and properly tagged at docker hub  |  20% |
|  test | image will be used in a pipeline and should pass tests  |  20% |