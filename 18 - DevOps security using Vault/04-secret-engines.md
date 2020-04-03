# DevOps security using Vault
## Secret Engines

### Objective
Be able to identify different types of secret engines, list their basic operations and use KV engines via cli and rest api.

### Instructions
Create a dummy repo or MD file explaining and showing the follow:
1. Enable secret engine cli/rest
1. Disable secret engine cli/rest
1. Enable secret engine with 10 secrets. Cli/rest
1. Modify the secrets 3 times
1. Rollback to version n1
1. Delete the secret.
1. Undelete the secret.
1. Destroy the secret.
1. Solve the instruqt task for [Your first secret and Use the KV V2 Secrets Engine](https://play.instruqt.com/hashicorp/tracks/vault-basics)

### Expected deliverables
- MD file with each activity question answered.
- Screenshot proving the resolution of the online exercise.

### Evaluation

| Metric name | Description | % Value |
| ----------- |-------------| -------:|
| Enable Secret Engines | Enable a KV secret engine | 10% |
| Disable Secrete Engines | Disable a KV secret engine | 10% |
| Add secrets | Create 10 secrets inside a secret engine | 10% |
| Modify secret | Rewrite 3 different versions of the same secret | 10% |
| Rollback | Rewind to version 1 of the same secret | 10% |
| Delete | Understand what is the deletion process in vault | 10% |
| Undelete | Return the secret to a desirable state | 10% |
| Destroy | Wipe out secret metadata | 10% |
| Instruqt Exercise | Solve both: Your First Secret and use the KV v2 secrets engine | 20% |
