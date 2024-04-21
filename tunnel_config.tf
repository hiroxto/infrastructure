resource "cloudflare_tunnel_config" "epgstation" {
  account_id = cloudflare_account.main.id
  tunnel_id  = cloudflare_tunnel.epgstation.id

  config {
    ingress_rule {
      hostname = "epgstation.hiroxto.net"
      service  = "http://localhost:8888"
      origin_request {}
    }
    ingress_rule {
      service = "http_status:404"
      origin_request {}
    }
  }
}
