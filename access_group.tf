resource "cloudflare_access_group" "epgstation" {
  account_id = cloudflare_account.main.id
  name       = "EPGStation"

  include {
    email = [var.admin_gmail_address]
  }
}
