variable "vault_address" {
  description = "Default VAULT_ADDR to communicate to the vault cluster"
  default     = "http://127.0.0.1:8200"
}

variable "vault_token" {
  description = "Default VAULT_TOKEN to communicate to the vault cluster"
  default     = "toor"
}
