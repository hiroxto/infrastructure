output "zone_id" {
  value = data.cloudflare_zone.main.id
}

output "records" {
  value = {
    cname_epgstation_hostname  = cloudflare_record.cname_epgstation.hostname
    cname_eq12_01_ssh_hostname = cloudflare_record.cname_eq12_01_ssh.hostname
  }
}
