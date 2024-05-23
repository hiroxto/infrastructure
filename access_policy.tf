resource "cloudflare_access_policy" "admin" {
  account_id = cloudflare_account.main.id
  name       = "Allow infra admin"
  decision   = "allow"

  include {
    group = [
      cloudflare_access_group.admin.id
    ]
  }
}
