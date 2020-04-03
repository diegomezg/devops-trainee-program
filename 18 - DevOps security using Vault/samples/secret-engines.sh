#! /bin/bash
curl \
    --header "X-Vault-Token: $VAULT_TOKEN" \
    $VAULT_ADDR/v1/sys/mounts | jq 

curl \
    --header "X-Vault-Token: $VAULT_TOKEN" \
    $VAULT_ADDR/v1/secret/data/myfirstengine/folder1 | jq

curl \
    --header "X-Vault-Token: $VAULT_TOKEN" \
    --request LIST \
    $VAULT_ADDR/v1/secret | jq

curl \
    --header "X-Vault-Token: $VAULT_TOKEN" \
    --request POST \
    --data @alumnos.json \
    $VAULT_ADDR/v1/myfirstengine/data/folder1

curl \
    --header "X-Vault-Token: $VAULT_TOKEN" \
    --request DELETE \
    $VAULT_ADDR/v1/myfirstengine/data/folder1

curl \
    --header "X-Vault-Token: $VAULT_TOKEN" \
    --request POST \
    --data @recover.json \
    $VAULT_ADDR/v1/myfirstengine/undelete/folder1

curl \
    --header "X-Vault-Token: $VAULT_TOKEN" \
    --request POST \
    --data @recover.json \
    $VAULT_ADDR/v1/myfirstengine/destroy/folder1