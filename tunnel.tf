resource "cloudflare_tunnel" "raspi_4b_01" {
  account_id = cloudflare_account.main.id
  # name を変更するとリソースが作り直しになるので古い名前のまま運用する
  name       = "raspi-4b-01-epgstation"
  secret     = var.tunnel_epgstation_secret
  config_src = "cloudflare"
}
