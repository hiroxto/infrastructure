resource "cloudflare_tunnel_config" "eq12_01" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_tunnel.eq12_01.id

  config {
    ingress_rule {
      hostname = cloudflare_access_application.epgstation.domain
      service  = "http://127.0.0.1:8080"
      origin_request {
        connect_timeout = "1m0s"
        tls_timeout     = "1m0s"
        tcp_keep_alive  = "1m0s"
      }
    }
    ingress_rule {
      hostname = cloudflare_access_application.eq12_01_ssh.domain
      service  = "ssh://127.0.0.1:9922"
    }
    ingress_rule {
      service = "http_status:404"
      origin_request {}
    }
  }
}
