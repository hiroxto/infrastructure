resource "cloudflare_email_routing_address" "main_gmail" {
  account_id = cloudflare_account.main.id
  email      = "hiroto.ktzw@gmail.com"
}
