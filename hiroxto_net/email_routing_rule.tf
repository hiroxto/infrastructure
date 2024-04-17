locals {
  bot = "bot"
}

resource "cloudflare_email_routing_rule" "forward_me_to_gmail" {
  zone_id = cloudflare_zone.main.id
  name    = "Forward me@${cloudflare_zone.main.zone} to Gmail"
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = "me@${cloudflare_zone.main.zone}"
  }

  action {
    type  = "forward"
    value = [var.email_routing_addresses.forward_me_to_gmail]
  }
}

resource "cloudflare_email_routing_rule" "forward_bot_to_gmail" {
  zone_id = cloudflare_zone.main.id
  name    = "Forward ${local.bot}@${cloudflare_zone.main.zone} to Gmail"
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = "${local.bot}@${cloudflare_zone.main.zone}"
  }

  action {
    type  = "forward"
    value = [var.email_routing_addresses.forward_bot_to_gmail]
  }
}
