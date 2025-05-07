resource "cloudflare_email_routing_address" "main_gmail" {
  account_id = var.cloudflare_account_id
  email      = var.admin_gmail_address
}
