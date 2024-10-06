resource "cloudflare_email_routing_catch_all" "main" {
  zone_id = data.cloudflare_zone.main.id
  name    = "Catch all"
  enabled = true

  matcher {
    type = "all"
  }

  action {
    type  = "forward"
    value = [var.email_catch_all_forward_to]
  }
}
