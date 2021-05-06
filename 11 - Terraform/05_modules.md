# Modules in terraform

Here you can find a starter code of some infrastructure for Azure using terraform modules:

https://github.com/danibyay/azure-quality-release

# Instructions

1. Clone the repo

2. Follow the instructions on `instructions.md` with a critical mind. 

- Remember you already have a resource group, so you don't need to create one again.

- You already created a service principal in activity 2, so you can skip that too.

- Create a new backend, reusing the instructions from activity 2.

- Follow the instructions to store the service principal secret on an Azure key vault

3. Run terraform init, validate, & plan inside the `terraform/` directory

4. Make the necessary changes if you get errors, some code is commented, uncomment it.

5. Once you understand how the modules are instantiated, use the vm module, it is missing!

6. Run terraform apply and document the output and the resources in the azure portal.

## Expected deliverables 

- Include the final version of your `main.tf`.

- Document the steps needed to get the apply without errors.

- Document the resources deployed in the portal

- Document the steps needed to use the key vault.

- Create a diagram like the one in [here](https://gitlab.com/dou-university/planning-committee/grad-program/-/blob/terraform/11%20-%20Terraform/04_basic_aws_infra_diagram.pdf) with the  corresponding resources deployed in this activity


## Measuring instrument

| Metric  |  Description | Value  |
| ------------ | ------------ | ------------ |
|  Configuration file | New main.tf file | 20%  |
|   Key vault | Key vault was used  |  15% |
|  Backend | New backend was used | 15%  |
|  Diagram |  Architecture diagram |  25% |
|  Documentation | Documentation of the steps needed to modify the file   |  10% |
|  Resources | Proof that the resources were deployed |  15% |
