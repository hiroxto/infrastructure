resource "cloudflare_zero_trust_access_group" "admin" {
  account_id = var.cloudflare_account_id
  name       = "Infra Admin"

  include {
    email = [
      var.admin_gmail_address
    ]
  }
}
