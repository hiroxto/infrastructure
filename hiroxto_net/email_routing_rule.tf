resource "cloudflare_email_routing_rule" "forward_me_to_gmail" {
  name    = "Forward me@${cloudflare_zone.main.zone} to Gmail"
  zone_id = cloudflare_zone.main.id
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = "me@${cloudflare_zone.main.zone}"
  }

  action {
    type  = "forward"
    value = ["hiroto.ktzw@gmail.com"]
  }
}
