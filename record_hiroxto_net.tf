#
# CNAME
#
resource "cloudflare_dns_record" "cname_train_photo_blog" {
  zone_id = data.cloudflare_zone.hiroxto_net.id
  type    = "CNAME"
  name    = "train-photo-blog.${data.cloudflare_zone.hiroxto_net.name}"
  content = data.cloudflare_pages_project.train_photo_blog.subdomain
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "cname_eq12_01_ssh" {
  zone_id = data.cloudflare_zone.hiroxto_net.id
  name    = "eq12-01-ssh.${data.cloudflare_zone.hiroxto_net.name}"
  type    = "CNAME"
  content = local.tunnel_eq12_01_cname
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "cname_raspi_4b_01_ssh" {
  zone_id = data.cloudflare_zone.hiroxto_net.id
  name    = "raspi-4b-01-ssh.${data.cloudflare_zone.hiroxto_net.name}"
  type    = "CNAME"
  content = local.tunnel_raspi_4b_01_cname
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "cname_epgstation" {
  zone_id = data.cloudflare_zone.hiroxto_net.id
  name    = "epgstation.${data.cloudflare_zone.hiroxto_net.name}"
  type    = "CNAME"
  content = local.tunnel_eq12_01_cname
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "cname_fr24_feeder_status_domain" {
  zone_id = data.cloudflare_zone.hiroxto_net.id
  name    = "fr24-feeder-status.${data.cloudflare_zone.hiroxto_net.name}"
  type    = "CNAME"
  content = local.tunnel_eq12_01_cname
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "cname_piaware" {
  zone_id = data.cloudflare_zone.hiroxto_net.id
  name    = "piaware.${data.cloudflare_zone.hiroxto_net.name}"
  type    = "CNAME"
  content = local.tunnel_eq12_01_cname
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "cname_navidrome" {
  zone_id = data.cloudflare_zone.hiroxto_net.id
  name    = "navidrome.${data.cloudflare_zone.hiroxto_net.name}"
  type    = "CNAME"
  content = local.tunnel_eq12_01_cname
  proxied = true
  ttl     = 1
}

#
# MX
#
resource "cloudflare_dns_record" "mx" {
  zone_id  = data.cloudflare_zone.hiroxto_net.id
  name     = data.cloudflare_zone.hiroxto_net.name
  type     = "MX"
  content  = "smtp.google.com"
  priority = 1
  ttl      = 1
}

#
# TXT
#
resource "cloudflare_dns_record" "txt_atproto" {
  zone_id = data.cloudflare_zone.hiroxto_net.id
  name    = "_atproto.${data.cloudflare_zone.hiroxto_net.name}"
  type    = "TXT"
  content = "did=did:plc:ky336ximtcas2d34kfg3sosh"
  comment = "For Bluesky handle"
  ttl     = 1
}

resource "cloudflare_dns_record" "txt_discord_verify" {
  zone_id = data.cloudflare_zone.hiroxto_net.id
  name    = "_discord.${data.cloudflare_zone.hiroxto_net.name}"
  type    = "TXT"
  content = "dh=9b1c2f16cbf35075da4701eeb1d5559925845383"
  ttl     = 1
}

resource "cloudflare_dns_record" "txt_google_site_verify" {
  zone_id = data.cloudflare_zone.hiroxto_net.id
  name    = data.cloudflare_zone.hiroxto_net.name
  type    = "TXT"
  content = "google-site-verification=OWvIVzu3yp2cgeSe6ubYDCEyBk0BchElGwtbEXLzcdw"
  comment = "For Google Site verify"
  ttl     = 1
}

resource "cloudflare_dns_record" "txt_keybase_verify" {
  zone_id = data.cloudflare_zone.hiroxto_net.id
  name    = data.cloudflare_zone.hiroxto_net.name
  type    = "TXT"
  content = "keybase-site-verification=awgxLY0PHHrVJQKhhDri44iFtoaXYmAk5MPD9L3PNqs"
  comment = "For Keybase verify"
  ttl     = 1
}

resource "cloudflare_dns_record" "txt_google_workspace" {
  zone_id = data.cloudflare_zone.hiroxto_net.id
  name    = data.cloudflare_zone.hiroxto_net.name
  type    = "TXT"
  content = "google-site-verification=uNQKhs5C7kXDOWKOl0qIRRCTmaTpiOwChk4P3_SxSRU"
  comment = "For Google Workspace"
  ttl     = 1
}

resource "cloudflare_dns_record" "txt_google_dkim" {
  zone_id = data.cloudflare_zone.hiroxto_net.id
  name    = "google._domainkey.${data.cloudflare_zone.hiroxto_net.name}"
  type    = "TXT"
  content = "\"v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuswZaiK4XRXRFjQtdTJEYQJI9n5kG3/BchMSttfXRDz2uel617MJo2miAvHDOME9l9ewoVa38j7wVkzF7PwsGQVClfgqjFSrtJQF1eU9ZsNBnMU2X43FOTtBzcb0qmpnGCzperUUVPjs5Pnf3/zkdD3patob11SH2m2jJHgtApzLrXTOh0Ftm3Zs3BNb/+M4F\" \"BsTkZQeJtiUmQbFIhbLtXB3pnYWlvuAzdi7LNVaThBhJhH8qi/hDEVxsvrsJ7ymYVRGzL6KuHFDGGlzZ806/NCBy4mmhjTZKt0CCiK3O2XyjtBy+fLF9PtlX10Ml53BI9qg6qQBBBpzHP1tAUdC8wIDAQAB\""
  comment = "For Google Workspace DKIM"
  ttl     = 1
}
