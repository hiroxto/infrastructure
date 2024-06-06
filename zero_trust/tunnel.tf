resource "cloudflare_tunnel" "eq12_01" {
  account_id = var.cloudflare_account_id
  name       = "eq12_01"
  secret     = base64encode(random_password.eq12_01_tunnel_secret.result)
  config_src = "cloudflare"
}

resource "random_password" "eq12_01_tunnel_secret" {
  length = 64
}
