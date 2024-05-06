resource "cloudflare_tunnel_config" "epgstation" {
  account_id = cloudflare_account.main.id
  tunnel_id  = cloudflare_tunnel.epgstation.id

  config {
    ingress_rule {
      hostname = "epgstation.hiroxto.net"
      service  = "http://localhost:8080"
      origin_request {
        connect_timeout = "1m0s"
        tls_timeout     = "1m0s"
        tcp_keep_alive  = "1m0s"
      }
    }
    ingress_rule {
      service = "http_status:404"
      origin_request {}
    }
  }
}
