## 02 – Working on teams and managing backends

Trainees will create the objects needed for a backend in AWS (lock table and S3 bucket) 2 or more will work on the same infrastructure and make changes to it using same state file.

##### Instructions

1. Create repository for the project
2. Create a separate directory on your project root with the name backend
3. Create the main.tf and variables.tf  files
4. Add the code to build the backend objects in main.tf:

```
provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "terraform-state-storage-s3" {
    bucket = var.s3_bucket_name
    versioning {
      enabled = true
    }
    lifecycle {
      prevent_destroy = false
    }
    tags={
      Name = "S3 Remote Terraform State Store"
    }
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = var.dynamodb_table_name
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
  tags={
    Name = "DynamoDB Terraform State Lock Table"
  }
}
```
###### Configure the main project to use the backend:

1.  Within the backend directory, run `terraform init` then `terraform plan` and `terraform apply`
2.   On your project where you are managing the aws objects, add this block in the `main.tf`:

```
terraform {
  backend "s3" {
    bucket         = "tf-remote-state-bucket-eks-cluster"
    key            = "envs/dev/terraform.tfstate"
    dynamodb_table = "terraform-state-lock-dynamo-eks-cluster"
    region         = "us-east-1"
  }
}
```
###### Validate all can make changes to the infra using same remote state:

1. In the `main.tf` trainees will create the code for couple of security groups in the default VPC.
2. Same trainee will run the `init` `plan` & `apply`
3. The other trainee will add another security group and run the same terraform cycle to deploy it.


##### Expected deliverables 

Code snippet for the backend configuration and proof of multiple users successfully working on the same infra using same remote state file. It can be the entries from the dynamoDB table or timestamps from the state file stored at the S3 bucket.


##### Measuring instrument 

| Metric  |  Description | Value  |
| ------------ | ------------ | ------------ |
|  Architectural adherence | Files organization and objects  | 40%  |
|   Functional| Clear idea and working  |  40% |
|  Integration with other tools | proper integration with aws    |  20% |


