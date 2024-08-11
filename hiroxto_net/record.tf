#
# CNAME
#
resource "cloudflare_record" "cname_root" {
  zone_id = data.cloudflare_zone.main.id
  name    = data.cloudflare_zone.main.name
  type    = "CNAME"
  content = var.records.cname_root
  proxied = true
}

resource "cloudflare_record" "cname_www" {
  zone_id = data.cloudflare_zone.main.id
  name    = "www"
  type    = "CNAME"
  content = var.records.cname_www
  proxied = true
}

resource "cloudflare_record" "cname_swarm_checkin_regulation_checker" {
  zone_id = data.cloudflare_zone.main.id
  name    = "swarm-checkin-regulation-checker"
  type    = "CNAME"
  content = "swarm-checkin-regulation-checker.pages.dev"
  proxied = true
}

resource "cloudflare_record" "cname_train_photo_blog" {
  zone_id = data.cloudflare_zone.main.id
  type    = "CNAME"
  name    = "train-photo-blog"
  content = var.records.cname_train_photo_blog
  proxied = true
}

resource "cloudflare_record" "cname_utils" {
  zone_id = data.cloudflare_zone.main.id
  name    = "utils"
  type    = "CNAME"
  content = "hiroxto-utils-hiroxto-net.pages.dev"
  proxied = true
}

resource "cloudflare_record" "cname_epgstation" {
  zone_id = data.cloudflare_zone.main.id
  name    = "epgstation"
  type    = "CNAME"
  content = var.records.cname_epgstation
  proxied = true
}

resource "cloudflare_record" "cname_eq12_01_ssh" {
  zone_id = data.cloudflare_zone.main.id
  name    = "eq12-01-ssh"
  type    = "CNAME"
  content = var.records.cname_eq12_01_ssh
  proxied = true
}

#
# MX
#
resource "cloudflare_record" "mx_1" {
  zone_id  = data.cloudflare_zone.main.id
  name     = data.cloudflare_zone.main.name
  type     = "MX"
  content  = "route1.mx.cloudflare.net"
  priority = 57
}

resource "cloudflare_record" "mx_2" {
  zone_id  = data.cloudflare_zone.main.id
  name     = data.cloudflare_zone.main.name
  type     = "MX"
  content  = "route2.mx.cloudflare.net"
  priority = 73
}

resource "cloudflare_record" "mx_3" {
  zone_id  = data.cloudflare_zone.main.id
  name     = data.cloudflare_zone.main.name
  type     = "MX"
  content  = "route3.mx.cloudflare.net"
  priority = 29
}

#
# TXT
#
resource "cloudflare_record" "txt_spf" {
  zone_id = data.cloudflare_zone.main.id
  name    = data.cloudflare_zone.main.name
  type    = "TXT"
  content = "v=spf1 include:_spf.mx.cloudflare.net include:_spf.google.com ~all"
}

resource "cloudflare_record" "txt_dmarc" {
  zone_id = data.cloudflare_zone.main.id
  name    = "_dmarc"
  type    = "TXT"
  content = "v=DMARC1;  p=none; rua=mailto:97f14f78b6474427b3c6f73b9464f836@dmarc-reports.cloudflare.net"
}

resource "cloudflare_record" "txt_atproto" {
  zone_id = data.cloudflare_zone.main.id
  name    = "_atproto"
  type    = "TXT"
  content = "did=did:plc:ky336ximtcas2d34kfg3sosh"
  comment = "For Bluesky handle"
}

resource "cloudflare_record" "txt_discord_verify" {
  zone_id = data.cloudflare_zone.main.id
  name    = "_discord.www.hiroxto.net"
  type    = "TXT"
  content = "dh=f2f8abd2008da9da8d2532f632b4af7f2843f428"
  comment = "For Discord verify"
}

resource "cloudflare_record" "txt_google_site_verify" {
  zone_id = data.cloudflare_zone.main.id
  name    = data.cloudflare_zone.main.name
  type    = "TXT"
  content = "google-site-verification=OWvIVzu3yp2cgeSe6ubYDCEyBk0BchElGwtbEXLzcdw"
  comment = "For Google Site verify"
}

resource "cloudflare_record" "txt_keybase_verify" {
  zone_id = data.cloudflare_zone.main.id
  name    = data.cloudflare_zone.main.name
  type    = "TXT"
  content = "keybase-site-verification=awgxLY0PHHrVJQKhhDri44iFtoaXYmAk5MPD9L3PNqs"
  comment = "For Keybase verify"
}
