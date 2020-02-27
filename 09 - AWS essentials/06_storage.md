## 05 – AWS Storage

#### Course content

1. -Permissions
2. -Transfer data
3. -Encryption
4. -Static sites
5. -Versioning
6. -Lifecycle policies
7. -Classes
8. -Presigned URLs


#### Static sites

1. Create bucket with unique name
2. Uncheck all perms
3. upload error and index files to bucket
4. Click the bucket name.
5. Navigate to Properties > Static website hosting.
6. Select Use this bucket to host a website.
7. For Index document, enter index.html.
8. For Error document, enter error.html.
9. Click Save.

#### Bucket policy

1. Navigate to Permissions > Bucket policy.
2. Add the following JSON statement (replacing <my-bucket> with your bucket name):


 {
  "Version":"2012-10-17",
  "Statement":[{
     "Sid":"PublicReadGetObject",
     "Effect":"Allow",
     "Principal": "*",
     "Action":["s3:GetObject"],
     "Resource":["arn:aws:s3:::<my-bucket>/*"]
   }]
}

3. Check access from browser to bucket url


#### Presigned URL

1. create AWS user with programatic access
2. attach policy to user with s3 perms:
 
Service: S3
Read: GetObject
Write: PutObject
Resources: arn:aws:s3:::bucket/*

3. take note of Access key ID and Secret access key
4. use aws cli to test : aws s3 presign s3://bucket/file.txt


Create a S3 bucket with custom properties.

##### Instructions

1.  Create a bucket with limited access
2.  Encrypt bucket
3.  Enable versioning
4.  Transfer data to S3 using aws cli


##### Expected deliverables 

Proof of S3 bucket attributes, it can be a screenshot, but preferrable using aws cli to describe bucket attributes.

##### Measuring instrument 

| Metric  |  Description | Value  |
| ------------ | ------------ | ------------ |
| Requirements | S3 bucket should have all requested attributes | 50%  |
| Tranfer | File transfer using cli should work  | 50%  |

