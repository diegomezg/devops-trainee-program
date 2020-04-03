resource "vault_github_user" "rigelreyes_github" {
  backend        = vault_github_auth_backend.github_auth.id
  user           = "rigelreyes"
  policies = ["admin"]
}

resource "vault_github_user" "alexkramble_github" {
  backend        = vault_github_auth_backend.github_auth.id
  user           = "alexkramble"
  policies = ["admin","audit"]
}