resource "cloudflare_record" "cname_root" {
  name    = "hiroxto.net"
  type    = "CNAME"
  value   = "hiroxto-net.netlify.app"
  zone_id = var.cloudflare_zone_id
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "cname_www" {
  name    = "www"
  type    = "CNAME"
  value   = "hiroxto-net.netlify.app"
  zone_id = var.cloudflare_zone_id
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "cname_swarm_checkin_regulation_checker" {
  name    = "swarm-checkin-regulation-checker"
  type    = "CNAME"
  value   = "swarm-checkin-regulation-checker.pages.dev"
  zone_id = var.cloudflare_zone_id
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "cname_train_photo_blog" {
  type    = "CNAME"
  name    = "train-photo-blog"
  value   = "hiroxto-train-photo-blog.netlify.app"
  zone_id = var.cloudflare_zone_id
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "cname_utils" {
  name    = "utils"
  type    = "CNAME"
  value   = "hiroxto-utils-hiroxto-net.pages.dev"
  zone_id = var.cloudflare_zone_id
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "mx_1" {
  name     = "hiroxto.net"
  type     = "MX"
  value    = "route1.mx.cloudflare.net"
  zone_id  = var.cloudflare_zone_id
  priority = 57
}

resource "cloudflare_record" "mx_2" {
  name     = "hiroxto.net"
  type     = "MX"
  value    = "route2.mx.cloudflare.net"
  zone_id  = var.cloudflare_zone_id
  priority = 73
}

resource "cloudflare_record" "mx_3" {
  name     = "hiroxto.net"
  type     = "MX"
  value    = "route3.mx.cloudflare.net"
  zone_id  = var.cloudflare_zone_id
  priority = 29
}

resource "cloudflare_record" "txt_atproto" {
  name    = "_atproto"
  type    = "TXT"
  value   = "did=did:plc:ky336ximtcas2d34kfg3sosh"
  zone_id = var.cloudflare_zone_id
  comment = "For Bluesky handle"
  proxied = false
  ttl     = 1
}
