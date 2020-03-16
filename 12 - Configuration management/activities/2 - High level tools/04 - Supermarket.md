# Chef

## 04 - Supermarket

### Instructions

#### What is Chef Supermarket?

The Chef Supermarket is a searchable repository for cookbooks. Most modern programming languages have repositories for open source packages (Pypi for Python, Rubygems.org for Ruby, etc.) and that is what the Chef Supermarket is for cookbooks. There are a few ways that you can interact with the Chef Supermarket:

1. Using the public supermarket
2. Deploying a private supermarket

If our organization has a collection of cookbooks that we utilize only internally and we’d like them to be accessible only from within our internal network, then we can deploy a private version of the supermarket. This allows us to share reusable cookbooks easily with other teams and internal projects. The public supermarket includes a lot of open source cookbooks, some of them officially maintained by Chef the company and many more that are published by enthusiastic Chef users.

Beware: not all of the cookbooks on the public supermarket are up to date and secure, you’ll want to vet anything open source cookbook that you use.

#### Other Supermarket Related Tools

By itself a repository of cookbooks isn’t useful, we need to be able to publish, version, and download the cookbooks. There are a few recommended tools for handling these workflows:

1. Berkshelf - used to install and manage cookbook dependencies and versions
2. Stove - used to version and publish cookbooks to a supermarket (either public or private).

### Expected deliverables
- Show and explain the usage of Chef SuperMarket. 

### Evaluation

| Metric name | Description | % Value |
| ----------- |-------------| -------:|
| 01 - Understanding  | Clear Understanding of Each of the Chef Concepts | %25 |
| 02 - Architecture Idea   | Project and Code Structure / Designed | %25 |
| 03 - Collaboration   | Team Working and Integration | %25 |
| 04 - Functional   | It could be useful for an improvement | %25 |
