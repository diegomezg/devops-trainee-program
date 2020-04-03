resource "vault_github_user" "rigelreyes_github" {
  backend        = vault_github_auth_backend.github_auth.id
  user           = "rigelreyes"
  policies = ["admin"]
}