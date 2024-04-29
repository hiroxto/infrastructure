resource "cloudflare_access_group" "dtv_admin" {
  account_id = cloudflare_account.main.id
  name       = "DTV Admin"

  include {
    email = [var.admin_gmail_address]
  }
}
