# 05 - Questions

Below we have a Terraform script for building a simple VPC public network with just one instance running the web server Apache in its default configuration, serving up the Apache welcome page. To run this use the following command:

    terraform apply -var-file=vars.tfvars

After completing each stage a test to show the things are still working would be to run the following command and expect to see the Apache welcome page HTML. (It may take some time for the server to be up and running after terraform completes)

    terraform output nginx_domain | xargs curl

##### Instructions
Complete the following exercices:

1. The EC2 instance running Apache went down over the weekend and we had an outage, it's been decided that we need a solution that is more resilient. Please implement a solution that demonstrates best practice resilience within a single region.