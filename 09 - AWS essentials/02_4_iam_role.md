## 02.5 – IAM role 

Create a role to allow EC2 communicate with S3 full access

##### Instructions

1. Create a new role with following requirements:
   1. Must be service role
   2. Must allow EC2 to connect to S3 service full access
   3. Include your name in role-name
   4. Create trust relationship
2. Create an EC2 instance using an amazon image in the default VPC
3. Associate your role to the instance
4. Access the EC2 instance through ssh
5. Through cli display attached role
6. Create an S3 bucket and list it
7. Delete the S3 bucket you just created


##### Expected deliverables 

md file with output from all steps taken in the EC2 instance


##### Measuring instrument 

| Metric  |  Description | Value  |
| ------------ | ------------ | ------------ |
| Role | role compliant with requirement  | 50%  |

