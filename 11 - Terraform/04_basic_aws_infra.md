## 04 – Basic AWS Infrastructure

Trainees will create and tie AWS resources: VPC, Security Group and Instance. You'll need to create a new git project called basic_aws_infra.

##### Instructions

1. Create file `main.tf` and include the following resources:
    - Provider
    - aws_security_group
    - aws_key_pair
    - aws_ami
    - aws_instance


2. In the same file include a public VPC with the following resources:
    - aws_vpc
    - aws_subnet
    - aws_route_table
    - aws_internet_gateway
    - aws_route_table_association
    - aws_route

* Configure the resources using the following diagram: https://gitlab.com/dou-university/planning-committee/grad-program/-/blob/terraform/11%20-%20Terraform/04_basic_aws_infra_diagram.pdf


# Modules (Optional)
* After you created the resources and confirmed that everything is working fine in AWS, we are going to proceed moduling these resources. Proceed with the following:

3. Inside your main project directory, create `modules` directory. Inside `modules`, create directories:
    - ami
    - security
    - securitygroup
    - vpc


4. Move resources in the directories as the following:
    - `aws_ami` resource in `ami` directory
    - `aws_key_pair` in `security`
    - `aws_security_group` in `securitygroup`
    - `aws_vpc`, `aws_subnet`, `aws_route_table`, `aws_internet_gateway`, `aws_route_table_association` and `aws_route` in `vpc`
    - Keep the `Provider` and `aws_instance` in `main.tf` file


5. In main.tf call the modules and then insert the required values in the aws_instance. To call these values you'll need to use the outputs inside each modules directory


##### Expected deliverables 

You have to be able to reach the server in port 22 using the public IP assigned to the instance after launch, submit proof of functionality and terraform code.

#### Measuring instrument
| Metric  |  Description | Value  |
| ------------ | ------------ | ------------ |
|  Security group | aws_security_group was implemented  | 8%  |
|   Key pair | aws_key_pair was implemented  |  8% |
|  AMI | aws_ami was implemented   |  8% |
|  VPC | aws_vpc was implemented   |  8% |
|  Subnet | aws_subnet was implemented   |  8% |
|  Route table | aws_route_table was implemented   |  8% |
|  Internet gateway | aws_internet_gateway was implemented   |  8% |
|  Route table association | aws_route_table_association was implemented   |  8% |
|  Route | aws_route was implemented   |  8% |
|  Functional | Provided scripts is fully functional   |  28% |


