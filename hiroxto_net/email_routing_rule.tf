resource "cloudflare_email_routing_rule" "me_to_gmail" {
  name    = "Forward me@hiroxto.net to Gmail"
  zone_id = var.cloudflare_zone_id
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = "me@hiroxto.net"
  }

  action {
    type  = "forward"
    value = ["hiroto.ktzw@gmail.com"]
  }
}
