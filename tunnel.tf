resource "cloudflare_tunnel" "epgstation" {
  account_id = cloudflare_account.main.id
  name       = "raspi-4b-01-epgstation"
  secret     = var.tunnel_epgstation_secret
  config_src = "cloudflare"
}
