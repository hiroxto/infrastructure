moved {
  from = cloudflare_dns_record.cname_navidrome
  to   = cloudflare_dns_record.cname_navidrome_media1
}

moved {
  from = cloudflare_zero_trust_access_application.navidrome
  to   = cloudflare_zero_trust_access_application.navidrome_media1
}
