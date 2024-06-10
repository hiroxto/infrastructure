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

resource "cloudflare_access_policy" "new_relic" {
  account_id = var.cloudflare_account_id
  name       = "Allow New Relic"
  decision   = "allow"

  include {
    service_token = [
      cloudflare_access_service_token.new_relic.id
    ]
  }
}
