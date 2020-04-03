resource "vault_policy" "audit" {
  name = "audit"

  policy = <<EOT
## Audit
# Remove audit devices
path "/sys/audit/*" {
 capabilities = ["delete"]
}
# Hash values to compare with audit logs
path "/sys/audit-hash/*" {
 capabilities = ["create"]
}
# Read HMAC configuration for redacting headers
path "/sys/config/auditing/request-headers" {
 capabilities = ["read", "sudo"]
}
# Configure HMAC for redacting headers
path "/sys/config/auditing/request-headers/*" {
 capabilities = ["read", "list", "create", "update", "sudo"]
}
# Get Storage Key Status
path "/sys/key-status" {
 capabilities = ["read"]
}
EOT
}

