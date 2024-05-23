resource "cloudflare_access_group" "admin" {
  account_id = cloudflare_account.main.id
  name       = "Infra Admin"

  include {
    email = [
      var.admin_gmail_address
    ]
  }
}
