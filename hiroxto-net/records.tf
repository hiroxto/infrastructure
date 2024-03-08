resource "cloudflare_record" "cname_hiroxto-net" {
  name    = "hiroxto.net"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "hiroxto-net.netlify.app"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "cname_swarm-checkin-regulation-checker" {
  name    = "swarm-checkin-regulation-checker"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "swarm-checkin-regulation-checker.pages.dev"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "cname_train-photo-blog" {
  name    = "train-photo-blog"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "hiroxto-train-photo-blog.netlify.app"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "cname_utils" {
  name    = "utils"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "hiroxto-utils-hiroxto-net.pages.dev"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "cname_www" {
  name    = "www"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "hiroxto-net.netlify.app"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "mx_5" {
  name     = "hiroxto.net"
  priority = 40
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "alt4.gmr-smtp-in.l.google.com"
  zone_id  = var.cloudflare_zone_id
}

resource "cloudflare_record" "mx_4" {
  name     = "hiroxto.net"
  priority = 30
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "alt3.gmr-smtp-in.l.google.com"
  zone_id  = var.cloudflare_zone_id
}

resource "cloudflare_record" "mx_3" {
  name     = "hiroxto.net"
  priority = 20
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "alt2.gmr-smtp-in.l.google.com"
  zone_id  = var.cloudflare_zone_id
}

resource "cloudflare_record" "mx_2" {
  name     = "hiroxto.net"
  priority = 10
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "alt1.gmr-smtp-in.l.google.com"
  zone_id  = var.cloudflare_zone_id
}

resource "cloudflare_record" "mx_1" {
  name     = "hiroxto.net"
  priority = 5
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "gmr-smtp-in.l.google.com"
  zone_id  = var.cloudflare_zone_id
}

resource "cloudflare_record" "txt_atproto" {
  comment = "For Bluesky handle"
  name    = "_atproto"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "did=did:plc:ky336ximtcas2d34kfg3sosh"
  zone_id = var.cloudflare_zone_id
}

