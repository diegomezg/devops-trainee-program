vault write auth/userpass/users/rigel \
    password=foo \
    policies=admin

vault write auth/userpass/users/daniela \
    password=foo \
    policies=mysecondengine-admin,myfirstengine-admin

## User-Pass cli
vault login -method=userpass \
    username=rigel \
    password=foo

vault login -method=userpass \
    username=daniela \
    password=foo

## User-Pass API
curl \
    --request POST \
    --data '{"password": "foo"}' \
    http://127.0.0.1:8200/v1/auth/userpass/login/mitchellh

vault write auth/userpass/users/mitchellh \
    password=foo \
    policies=admins

curl \
    --header "X-Vault-Token: $VAULT_TOKEN" \
    --request POST \
    --data @github.json \
    $VAULT_ADDR/v1/sys/auth/github

curl \
    --header "X-Vault-Token: $VAULT_TOKEN" \
    --request POST \
    --data @rigelreyes.json \
    $VAULT_ADDR/v1/auth/github/map/users/rigelreyes

curl \
    --header "X-Vault-Token: $VAULT_TOKEN" \
    $VAULT_ADDR/v1/auth/github/map/users/rigelreyes

vault login -method=github \
    username=rigelreyes

curl \
    --header "X-Vault-Token: $VAULT_TOKEN" \
    --request POST \
    --data @organization.json \
    $VAULT_ADDR/v1/auth/github/config