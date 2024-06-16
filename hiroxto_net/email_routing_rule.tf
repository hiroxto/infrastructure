locals {
  mail_username = {
    me  = "me"
    bot = "bot"
  }
}

resource "cloudflare_email_routing_rule" "forward_me_to_gmail" {
  zone_id = data.cloudflare_zone.main.id
  name    = "Forward ${local.mail_username.me}@${data.cloudflare_zone.main.name} to Gmail"
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = "${local.mail_username.me}@${data.cloudflare_zone.main.name}"
  }

  action {
    type  = "forward"
    value = [var.email_routing_addresses.forward_me_to_gmail]
  }
}

resource "cloudflare_email_routing_rule" "forward_bot_to_gmail" {
  zone_id = data.cloudflare_zone.main.id
  name    = "Forward ${local.mail_username.bot}@${data.cloudflare_zone.main.name} to Gmail"
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = "${local.mail_username.bot}@${data.cloudflare_zone.main.name}"
  }

  action {
    type  = "forward"
    value = [var.email_routing_addresses.forward_bot_to_gmail]
  }
}
