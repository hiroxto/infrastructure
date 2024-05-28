resource "cloudflare_access_policy" "admin" {
  account_id = var.cloudflare_account_id
  name       = "Allow infra admin"
  decision   = "allow"

  include {
    group = [
      cloudflare_access_group.admin.id
    ]
  }
}
