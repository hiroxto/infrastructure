output "zone_id" {
  value = cloudflare_zone.main.id
}

output "records" {
  value = {
    cname_epgstation_hostname = cloudflare_record.cname_epgstation.hostname
  }
}
