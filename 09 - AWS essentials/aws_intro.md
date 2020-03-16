
## AWS Brief History

- Starts in 2002, only developer tools to incorporate amazon.com features to other sites
- 2006 March, S3 becomes the first service released
- 2006 July, SQS service is released
- 2006 August, EC2 service is released
- 2007 December, SimpleDB service is released
- 2008 March, EIP
- 2008 August, EBS
- 2008 Nov, CloudFront
- 2009 Apr, EMR(Elasti Map Reduce)
- 2009 Aug, VPC service is released
- 2009 Oct, RDS
- 2010 Apr, SNS
- 2010 May, CloudFormation
- 2010 Dec, R53
- 2011 Jan, Elastic Beanstalk
- 2012 Jan, DynamoDB
- 2012 Nov, Redshift
- 2013 Nov, CloudTrail
- 2014 Nov, Aurora, ECS, KMS, Lambda(FaaS)
- 2015 Dec, ECR
- 2016 Jun, EFS

### Services
- https://aws.amazon.com/products/

### Regions and Availability Zones
- https://aws.amazon.com/about-aws/global-infrastructure/regions_az/?p=ngi&loc=2
- https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html
  

## IAM

- Controls all access to AWS API endpoints
- Controls access to services via policies that can be attached to users, groups and roles


### User

An IAM user is an entity that you create in AWS. The IAM user represents the person or service who uses the IAM user to interact with AWS. A primary use for IAM users is to give people the ability to sign in to the AWS Management Console for interactive tasks and to make programmatic requests to AWS services using the API or CLI.


### Group

An IAM group is a collection of IAM users. You can use groups to specify permissions for a collection of users, which can make those permissions easier to manage for those users. For example, you could have a group called Admins and give that group the types of permissions that administrators typically need. Any user in that group automatically has the permissions that are assigned to the group. 

### Role

An IAM role is very similar to a user, in that it is an identity with permission policies that determine what the identity can and cannot do in AWS. However, a role does not have any credentials (password or access keys) associated with it. Instead of being uniquely associated with one person, a role is intended to be assumable by anyone who needs it. An IAM user can assume a role to temporarily take on different permissions for a specific task. A role can be assigned to a federated user who signs in by using an external identity provider instead of IAM. AWS uses details passed by the identity provider to determine which role is mapped to the federated user.


**source:** https://docs.aws.amazon.com/IAM/latest/UserGuide/id.html


### Policy

**Version:** https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_version.html
**Structure:**  https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-policy-structure.html

```
{
  "Statement":[{
    "Effect":"effect",
    "Action":"action",
    "Resource":"arn",
    "Condition":{
      "condition":{
        "key":"value"
        }
      }
    }
  ]
}
```




#### Policy IAM Mgmt 
https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_delegate-permissions_examples.html



### Role trust relationship policy

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
```