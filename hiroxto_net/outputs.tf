output "zone_id" {
  value = data.cloudflare_zone.main.id
}

output "cname_eq12_01_ssh_hostname" {
  value = cloudflare_record.cname_eq12_01_ssh.hostname
}

output "cname_raspi_4b_01_ssh_hostname" {
  value = cloudflare_record.cname_raspi_4b_01_ssh.hostname
}

output "cname_epgstation_hostname" {
  value = cloudflare_record.cname_epgstation.hostname
}

