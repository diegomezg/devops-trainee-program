# Chef

## 05 - Test Kitchen

### Instructions

#### What is Test Kitchen?

Test Kitchen (or just “Kitchen”) is a testing harness that allows us to easily provision environments using a variety of platforms and backends so that we can test our infrastructure code. We can easily create a brand new “server” that is running a specific operating system, install Chef, run a specific run list, and then execute automated tests to ensure that the configuration that we’re expecting is configured properly. This process might sound tedious, but we can use VM tools like Vagrant or containers through Docker to rapidly create, configure, test, and destroy these environments. This is much faster and less expensive than creating servers in our cloud provider of choice (although Kitchen does have drivers to work directly with cloud providers).

We’ll be using Kitchen throughout this course, and it is used extensively when preparing for the Local Cookbook Development Badge.

### Expected deliverables
- Show and explain the purpose of Test Kitchen. 

### Evaluation

| Metric name | Description | % Value |
| ----------- |-------------| -------:|
| 01 - Understanding  | Clear Understanding of Each of the Chef Concepts | %25 |
| 02 - Architecture Idea   | Project and Code Structure / Designed | %25 |
| 03 - Collaboration   | Team Working and Integration | %25 |
| 04 - Functional   | It could be useful for an improvement | %25 |
