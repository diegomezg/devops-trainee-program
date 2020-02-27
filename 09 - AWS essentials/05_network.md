## 03 – AWS Network

Create a VPC and all network components manually.

##### Instructions

1. Create the VPC
2. Create subnets (public and private)
3. Create Route tables
4. Create an Internet Gateway
5. Create an EC2 instance and setup as Bastion
6. Create an EC2 instance and make it use private subnet
7. Create a NAT gateway for the instances using private subnet
8. Setting up NACL’s
9. Create route table rules to communicate public subnet with private
10. Test bastion is reachable from your local
11. Test bastion is able to reach instance from private subnet


##### Expected deliverables 

Proof of VPC and their components, aws cli output from aws vpc, some examples:
```
aws ec2 describe-vpcs \
    --vpc-ids vpc-06e4ab6c6cEXAMPLE

aws ec2 describe-subnets \
    --filters "Name=vpc-id,Values=vpc-06e4ab6c6cEXAMPLE"
```

You will have to figure out for the rest of components


##### Measuring instrument 

| Metric  |  Description | Value  |
| ------------ | ------------ | ------------ |
| Understanding | Network objects concepts should be clear  | 25%  |
| Proficiency | Demonstrate to be comfortable working with network objects  | 25%  |
| VPC | Working VPC | 50%  |


