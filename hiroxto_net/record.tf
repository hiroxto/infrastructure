#
# CNAME
#
resource "cloudflare_record" "cname_root" {
  zone_id = cloudflare_zone.main.id
  name    = cloudflare_zone.main.zone
  type    = "CNAME"
  value   = "hiroxto-net.netlify.app"
  proxied = true
}

resource "cloudflare_record" "cname_www" {
  zone_id = cloudflare_zone.main.id
  name    = "www"
  type    = "CNAME"
  value   = "hiroxto-net.netlify.app"
  proxied = true
}

resource "cloudflare_record" "cname_swarm_checkin_regulation_checker" {
  zone_id = cloudflare_zone.main.id
  name    = "swarm-checkin-regulation-checker"
  type    = "CNAME"
  value   = "swarm-checkin-regulation-checker.pages.dev"
  proxied = true
}

resource "cloudflare_record" "cname_train_photo_blog" {
  zone_id = cloudflare_zone.main.id
  type    = "CNAME"
  name    = "train-photo-blog"
  value   = "hiroxto-train-photo-blog.netlify.app"
  proxied = true
}

resource "cloudflare_record" "cname_utils" {
  zone_id = cloudflare_zone.main.id
  name    = "utils"
  type    = "CNAME"
  value   = "hiroxto-utils-hiroxto-net.pages.dev"
  proxied = true
}

resource "cloudflare_record" "cname_epgstation" {
  zone_id = cloudflare_zone.main.id
  name    = "epgstation"
  type    = "CNAME"
  value   = var.records.cname_epgstation
  proxied = true
}

#
# MX
#
resource "cloudflare_record" "mx_1" {
  zone_id  = cloudflare_zone.main.id
  name     = cloudflare_zone.main.zone
  type     = "MX"
  value    = "route1.mx.cloudflare.net"
  priority = 57
}

resource "cloudflare_record" "mx_2" {
  zone_id  = cloudflare_zone.main.id
  name     = cloudflare_zone.main.zone
  type     = "MX"
  value    = "route2.mx.cloudflare.net"
  priority = 73
}

resource "cloudflare_record" "mx_3" {
  zone_id  = cloudflare_zone.main.id
  name     = cloudflare_zone.main.zone
  type     = "MX"
  value    = "route3.mx.cloudflare.net"
  priority = 29
}

#
# TXT
#
resource "cloudflare_record" "txt_spf" {
  zone_id = cloudflare_zone.main.id
  name    = cloudflare_zone.main.zone
  type    = "TXT"
  value   = "v=spf1 include:_spf.mx.cloudflare.net include:_spf.google.com ~all"
}

resource "cloudflare_record" "txt_dmarc" {
  zone_id = cloudflare_zone.main.id
  name    = "_dmarc"
  type    = "TXT"
  value   = "v=DMARC1;  p=none; rua=mailto:97f14f78b6474427b3c6f73b9464f836@dmarc-reports.cloudflare.net"
}

resource "cloudflare_record" "txt_atproto" {
  zone_id = cloudflare_zone.main.id
  name    = "_atproto"
  type    = "TXT"
  value   = "did=did:plc:ky336ximtcas2d34kfg3sosh"
  comment = "For Bluesky handle"
}

resource "cloudflare_record" "txt_discord_verify" {
  zone_id = cloudflare_zone.main.id
  name    = "_discord"
  type    = "TXT"
  value   = "dh=9b1c2f16cbf35075da4701eeb1d5559925845383"
  comment = "For Discord verify"
}
