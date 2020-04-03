# DevOps security using Vault
## Terraform Vault Provider

### Objective
Automate vault configuration using the terraform vault provider.

### Instructions
Create a dummy repo or MD file explaining and showing the follow:
1. Init vault provider with terraform.
1. Enable userpass, approle and github authentication methods with vault_auth_backend resource.
1. Write the basic adoption guide policies (admin, audit and key officer) with vault_policy resource.
1. Add a 2 users, 1 userpass and 1 github using the user resource and assign them the admin policy and key officer policies.

### Expected deliverables
- MD file with each activity question answered.

### Evaluation

| Metric name | Description | % Value |
| ----------- |-------------| -------:|
| Initialize vault provide | Configure a vault.tf file with the vault provider | 10% |
| Enable Auth Methods | Enable auth methods with the terraform the auth backend resource | 30% |
| Polices | User the policy resource to write 3 policies | 30% |
| User add | Add 2 users with the right user resource | 30% |
