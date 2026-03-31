resource "cloudflare_zero_trust_access_policy" "admin" {
  account_id = var.cloudflare_account_id
  name       = "Allow infra admin"
  decision   = "allow"

  include = [{
    group = {
      id = cloudflare_zero_trust_access_group.admin.id
    }
  }]
}
