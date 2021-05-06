## 03 – Integrating Terraform to CICD tools

Trainees will design a simple pipeline using Gitlab feature gitlab-ci. They will work with AWS on this practice. You can use an existing project from AWS or create a new one with a simple scope, nothing complex. In this activity we will use gitlab gui for the pipeline development in order to get a clear idea of CI feature.

##### Instructions

1. Create a project in gitlab, then upload an existing terraform repository containing code for AWS or develop from scratch.
2. Once you previously tested terraform code is in the repository, create a new file named `gitlab-ci.yml`
3. Click on add button:
	- Select the branch
	- Select `gitlab-ci.yml`
	- Select `template type`
	- Look for `terraform` and select
4. Modify the pipeline stages accordingly
5. Setup env variables
	- On the left menu select Settings -> CICD -> Variables
	- Setup the AWS keys
6. Make a change to the infrastructure and push the changes to the repository.


##### Expected deliverables 

`gitlab-ci.yml` code and proof of successful stages completion from the pipeline, it can be a screenshot.


##### Measuring instrument 

| Metric  |  Description | Value  |
| ------------ | ------------ | ------------ |
| Pipeline | Pipeline file was made | 40%  |
|   Terraform| Simple configuration was written  |  40% |
|  Result | Document proof that the pipeline worked and created resources   |  20% |


