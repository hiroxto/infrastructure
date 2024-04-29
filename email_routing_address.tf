resource "cloudflare_email_routing_address" "main_gmail" {
  account_id = cloudflare_account.main.id
  email      = var.admin_gmail_address
}
