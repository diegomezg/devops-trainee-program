resource "vault_github_auth_backend" "github_auth" {
  organization = "Last-Code-In-Earth"
}

resource "vault_auth_backend" "userpass_auth" {
  path = "userpass"
  type = "userpass"
  description = "Default userpass authentication method"
}

resource "vault_auth_backend" "kubernetes_auth" {
  path = "kubernetes"
  type = "kubernetes"
  description = "Default kubernetes authentication method"
}

data "vault_approle_auth_backend_role_id" "role" {
  backend   = "my-approle-backend"
  role_name = "my-role"
}

output "role-id" {
  value = "${data.vault_approle_auth_backend_role_id.role.role_id}"
}
