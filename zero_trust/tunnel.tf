resource "cloudflare_tunnel" "raspi_4b_01" {
  account_id = var.cloudflare_account_id
  # name を変更するとリソースが作り直しになるので古い名前のまま運用する
  name       = "raspi-4b-01-epgstation"
  secret     = var.tunnel_epgstation_secret
  config_src = "cloudflare"
}

resource "cloudflare_tunnel" "eq12_01" {
  account_id = var.cloudflare_account_id
  name       = "eq12_01"
  secret     = base64encode(random_password.eq12_01_tunnel_secret.result)
  config_src = "cloudflare"
}

resource "random_password" "eq12_01_tunnel_secret" {
  length = 64
}
