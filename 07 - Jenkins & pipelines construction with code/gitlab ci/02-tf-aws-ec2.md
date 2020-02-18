# Gitlab pipeline to deploy aws ec2 instance using terraform

### Instructions

1. Create a new project in gitlab named ***tf-aws-ci*** (or whatever you want to name it)
2. Follow the instructions to start working with that repository in your local environment
3. Create a file `ec2.tf` with the following content
```
# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"
provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
    Owner = "YourName"
  }
}

```
4. Create a new file named `.gitlab-ci.yaml` 
5. Add the following to the file and make sure you replace image `name` for the one you built in Docker activity 6 :
```
image:
  name: 
  entrypoint:
    - '/usr/bin/env'
    - 'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'

stages:
  - validate
  - plan
  - apply

#########################################################
# Anchors definition                                    #
#########################################################
.validate: &validate
  stage: validate
  script:
    - terraform validate
    - terraform fmt -check=true

.plan: &plan
  stage: plan
  script:
    - terraform plan -out "$ENV.tfplan"
  artifacts:
    name: plan
    paths:
      - $ENV.tfplan

.apply: &apply
  stage: apply
  when: manual
  allow_failure: true
  script:
    - terraform apply -input=false -auto-approve
  environment:
     name: $ENV
  only:
  - master

.destroy: &destroy
  stage: destroy
  when: manual
  allow_failure: true
  script:
    - terraform destroy -input=false -auto-approve
  environment:
     name: $ENV
  only:
  - master


#########################################################
# Environments:                                         #
# Currently using variables to define environments      #
# This should be changed to use branches instead.       #
#########################################################

.development: &development
  variables:
    ENV: development
    
cache:
  paths:
    - .terraform

before_script:
  - export TF_IN_AUTOMATION=true
  - terraform --version
  - terraform init

#######################################################
# Stages calls                                        #
#######################################################

development_validate:
  <<: [*development, *validate]

development_plan:
  <<: [*development, *plan]

development_apply:
  <<: [*development, *apply]
  dependencies:
    - development_plan

```
1. On the left menu go to Settings -> CICD -> Variables(Expand)
   1. Add `AWS_ACCESS_KEY_ID` and the value
   2. Add `AWS_SECRET_ACCESS_KEY` and the value
2. Commit your changes and push to master
3. Validate pipeline completes successfully and at the AWS console the instance is present
4. Terminate your instance



### Expected deliverables

MD file containing URL to the successful job and screenshot of AWS console showing EC2 instance with the owner tag


### Evaluation

| Metric name | Description | % Value |
| ----------- |-------------| -------:|
| Pipeline  | Successful pipeline completion| %50 |
| Artifact    | EC2 instance is present at AWS  | %30 |
| Understanding   | Clear understanding of | %20 |
