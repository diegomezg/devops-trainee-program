resource "vault_policy" "key_officer" {
  name = "key_officer"

  policy = <<EOT
## Key Officers
path "/sys/generate-root/update" {
 capabilities = ["create", "update"]
}
# Get Storage Key Status
path "/sys/key-status" {
 capabilities = ["read"]
}
# Submit Key for Re-keying purposes
path "/sys/rekey-recovery-key/update" {
 capabilities = ["create", "update"]
}
# Rotate Storage Key
path "/sys/rotate" {
 capabilities = ["update", "sudo"]
}
# Verify update
path "/sys/rekey-recovery-key/verify" {
 capabilities = ["create", "update"]
}
EOT
}

