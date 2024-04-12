resource "cloudflare_email_routing_rule" "forward_me_to_gmail" {
  name    = "Forward me@${var.domain_name} to Gmail"
  zone_id = var.cloudflare_zone_id
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = "me@${var.domain_name}"
  }

  action {
    type  = "forward"
    value = ["hiroto.ktzw@gmail.com"]
  }
}
