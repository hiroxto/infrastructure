#
# CNAME
#
resource "cloudflare_dns_record" "cname_root" {
  zone_id = var.zone_id
  name    = data.cloudflare_zone.main.name
  type    = "CNAME"
  content = var.cname_www
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "cname_www" {
  zone_id = var.zone_id
  name    = "www.${data.cloudflare_zone.main.name}"
  type    = "CNAME"
  content = var.cname_www
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "cname_swarm_checkin_regulation_checker" {
  zone_id = var.zone_id
  name    = "swarm-checkin-regulation-checker.${data.cloudflare_zone.main.name}"
  type    = "CNAME"
  content = var.cname_swarm_checkin_regulation_checker
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "cname_train_photo_blog" {
  zone_id = var.zone_id
  type    = "CNAME"
  name    = "train-photo-blog.${data.cloudflare_zone.main.name}"
  content = var.cname_train_photo_blog
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "cname_utils" {
  zone_id = var.zone_id
  name    = "utils.${data.cloudflare_zone.main.name}"
  type    = "CNAME"
  content = var.cname_utils
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "cname_eq12_01_ssh" {
  zone_id = var.zone_id
  name    = "eq12-01-ssh.${data.cloudflare_zone.main.name}"
  type    = "CNAME"
  content = var.cname_eq12_01_ssh
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "cname_raspi_4b_01_ssh" {
  zone_id = var.zone_id
  name    = "raspi-4b-01-ssh.${data.cloudflare_zone.main.name}"
  type    = "CNAME"
  content = var.cname_raspi_4b_01_ssh
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "cname_epgstation" {
  zone_id = var.zone_id
  name    = "epgstation.${data.cloudflare_zone.main.name}"
  type    = "CNAME"
  content = var.cname_epgstation
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "cname_fr24_feeder_status_domain" {
  zone_id = var.zone_id
  name    = "fr24-feeder-status.${data.cloudflare_zone.main.name}"
  type    = "CNAME"
  content = var.cname_fr24_feeder_status_domain
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "cname_piaware" {
  zone_id = var.zone_id
  name    = "piaware.${data.cloudflare_zone.main.name}"
  type    = "CNAME"
  content = var.cname_piaware_domain
  proxied = true
  ttl     = 1
}

#
# MX
#
resource "cloudflare_dns_record" "mx_1" {
  zone_id  = var.zone_id
  name     = data.cloudflare_zone.main.name
  type     = "MX"
  content  = "route1.mx.cloudflare.net"
  priority = 57
  ttl      = 1
}

resource "cloudflare_dns_record" "mx_2" {
  zone_id  = var.zone_id
  name     = data.cloudflare_zone.main.name
  type     = "MX"
  content  = "route2.mx.cloudflare.net"
  priority = 73
  ttl      = 1
}

resource "cloudflare_dns_record" "mx_3" {
  zone_id  = var.zone_id
  name     = data.cloudflare_zone.main.name
  type     = "MX"
  content  = "route3.mx.cloudflare.net"
  priority = 29
  ttl      = 1
}

#
# TXT
#
resource "cloudflare_dns_record" "txt_spf" {
  zone_id = var.zone_id
  name    = data.cloudflare_zone.main.name
  type    = "TXT"
  content = "v=spf1 include:_spf.mx.cloudflare.net include:_spf.google.com ~all"
  ttl     = 1
}

resource "cloudflare_dns_record" "txt_dmarc" {
  zone_id = var.zone_id
  name    = "_dmarc.${data.cloudflare_zone.main.name}"
  type    = "TXT"
  content = "v=DMARC1;  p=none; rua=mailto:97f14f78b6474427b3c6f73b9464f836@dmarc-reports.cloudflare.net"
  ttl     = 1
}

resource "cloudflare_dns_record" "txt_atproto" {
  zone_id = var.zone_id
  name    = "_atproto.${data.cloudflare_zone.main.name}"
  type    = "TXT"
  content = "did=did:plc:ky336ximtcas2d34kfg3sosh"
  comment = "For Bluesky handle"
  ttl     = 1
}

resource "cloudflare_dns_record" "txt_discord_verify" {
  zone_id = var.zone_id
  name    = "_discord.www.${data.cloudflare_zone.main.name}"
  type    = "TXT"
  content = "dh=f2f8abd2008da9da8d2532f632b4af7f2843f428"
  comment = "For Discord verify"
  ttl     = 1
}

resource "cloudflare_dns_record" "txt_google_site_verify" {
  zone_id = var.zone_id
  name    = data.cloudflare_zone.main.name
  type    = "TXT"
  content = "google-site-verification=OWvIVzu3yp2cgeSe6ubYDCEyBk0BchElGwtbEXLzcdw"
  comment = "For Google Site verify"
  ttl     = 1
}

resource "cloudflare_dns_record" "txt_keybase_verify" {
  zone_id = var.zone_id
  name    = data.cloudflare_zone.main.name
  type    = "TXT"
  content = "keybase-site-verification=awgxLY0PHHrVJQKhhDri44iFtoaXYmAk5MPD9L3PNqs"
  comment = "For Keybase verify"
  ttl     = 1
}
