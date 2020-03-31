# Vault

## Goals
The main goal of this course is to the allow the trainee to deploy and operate vault, understanding the fundamental concepts and internals.

## Objectives
- Understand the basic usage and Architecture of Hashicorp Vault.
- Learn vault fundamentals usage and concepts and how to enable them: Secret Engines, Authentication Methods and Policy creation.
- Operate Vault with UI, CLI and RestAPI and learn the basics of operations like status and init.
- Deploy and configure Vault for production environments.
- Learn how to automate vault configuration with Terraform provider and scripting tools.

## Contents
1.    TAO of HashiCorp
1.    What is Vault
1.    How to install Vault locally (Vagrant)
1.    Init and unseal vault.
1.    Vault Tokens life cycle
1.    Vault Secret engines
    1.    PKI
    1.    K/V
    1.    MSSQL
1.    Vault Policies
1.    Vault roles
1.    Vault Auth methods
    1.    AppRole
    1.    GitHub
    1.    Username and password
1.    Vault credential rotation
    1.    MSSQL
1.    Vault entities and groups
1.    Terraform vault provider

## Learning materials
- [Tao of HashiCorp](https://www.hashicorp.com/tao-of-hashicorp)
- [Learn Hashicorp](https://learn.hashicorp.com/vault)
- [Katakoda Scenarios](https://www.katacoda.com/?q=hashicorp%20vault&hPP=12&idx=scenarios&p=0&is_v=1)
- [Vault Documentation](https://www.vaultproject.io/docs/)
- [Vault basics](https://play.instruqt.com/hashicorp/tracks/vault-basics)
- [Token lifecycle](https://www.katacoda.com/hashicorp/scenarios/vault-tokens)
- [Secret Engines](https://learn.hashicorp.com/vault/getting-started/secrets-engines)
- [Static Secrets](https://www.katacoda.com/hashicorp/scenarios/vault-static-secrets)
- [Vault policies Scenarios](https://www.katacoda.com/hashicorp/scenarios/vault-policies)
- [Working with vault Polices](https://learn.hashicorp.com/vault/getting-started/policies)
- [Vault Authentication Scenarios](https://www.katacoda.com/hashicorp/scenarios/vault-auth)
- [Vault AppRole](https://www.katacoda.com/hashicorp/scenarios/vault-approle)
- [Vault Auth Methods](https://learn.hashicorp.com/vault/getting-started/authentication)
- [Credential rotation](https://learn.hashicorp.com/vault/secrets-management/db-root-rotation). Download dbvizualizer to test credendtial rotation.
- [Vault entities and groups](https://www.katacoda.com/hashicorp/scenarios/vault-identity)
- Terraform provider.

## Course activities
1. Install vault with docker
1. Secret engines
1. Policies
1. Authentication methods
1. Token lifecycle
1. Vault operation (seal/unseal)
1. Vault entities
1. Terraform provider

## Collaborators
Name     |   Slack  | Email |
---------|----------|----------|
Bernardo Garza    | @bernardo.garza | bernardo.garza@digitalonus.com |
Rigel Reyes     | @Rigel Reyes | rigel.reyes@digitalonus.com |
