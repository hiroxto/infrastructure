resource "cloudflare_email_routing_catch_all" "main" {
  zone_id = cloudflare_zone.main.id
  name    = "Catch all"
  enabled = true

  matcher {
    type = "all"
  }

  action {
    type  = "forward"
    value = [var.email_routing_addresses.catch_all]
  }
}
