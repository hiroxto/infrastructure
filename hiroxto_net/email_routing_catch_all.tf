resource "cloudflare_email_routing_catch_all" "main" {
  zone_id = var.zone_id
  name    = "Catch all"
  enabled = true

  matchers = [
    {
      type = "all"
    }
  ]

  actions = [
    {
      type = "forward"
      value = [
        var.email_catch_all_forward_to
      ]
    }
  ]
}
