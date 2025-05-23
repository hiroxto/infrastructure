#
# eq12-01
#
resource "cloudflare_zero_trust_tunnel_cloudflared" "eq12_01" {
  account_id    = var.cloudflare_account_id
  name          = "eq12_01"
  tunnel_secret = base64encode(random_password.eq12_01_tunnel_secret.result)
  config_src    = "cloudflare"
}

resource "random_password" "eq12_01_tunnel_secret" {
  length = 64
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "eq12_01" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.eq12_01.id
  source     = "cloudflare"

  config = {
    ingress = [
      {
        hostname = cloudflare_zero_trust_access_application.epgstation.domain
        service  = "http://127.0.0.1:8080"
        origin_request = {
          connect_timeout = 60
          tls_timeout     = 60
          tcp_keep_alive  = 60
        }
      },
      {
        hostname = cloudflare_zero_trust_access_application.eq12_01_ssh.domain
        service  = "ssh://127.0.0.1:9922"
      },
      {
        service = "http_status:404"
      }
    ]
  }
}

#
# raspi-4b-01
#
resource "cloudflare_zero_trust_tunnel_cloudflared" "raspi_4b_01" {
  account_id    = var.cloudflare_account_id
  name          = "raspi_4b_01"
  tunnel_secret = base64encode(random_password.raspi_4b_01_tunnel_secret.result)
  config_src    = "cloudflare"
}

resource "random_password" "raspi_4b_01_tunnel_secret" {
  length = 64
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "raspi_4b_01" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.raspi_4b_01.id
  source     = "cloudflare"

  config = {
    ingress = [
      {
        hostname = cloudflare_zero_trust_access_application.raspi_4b_01_ssh.domain
        service  = "ssh://127.0.0.1:9973"
      },
      {
        service = "http_status:404"
      }
    ]
  }
}
