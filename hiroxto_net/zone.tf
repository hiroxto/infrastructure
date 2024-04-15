resource "cloudflare_zone" "main" {
  account_id = cloudflare_account.main.id
  zone       = "hiroxto.net"
}
