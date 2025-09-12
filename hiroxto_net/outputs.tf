output "zone_id" {
  value = var.zone_id
}

output "cname_eq12_01_ssh_hostname" {
  value = cloudflare_dns_record.cname_eq12_01_ssh.name
}

output "cname_raspi_4b_01_ssh_hostname" {
  value = cloudflare_dns_record.cname_raspi_4b_01_ssh.name
}

output "cname_epgstation_hostname" {
  value = cloudflare_dns_record.cname_epgstation.name
}

output "cname_fr24_feeder_status_hostname" {
  value = cloudflare_dns_record.cname_fr24_feeder_status_domain.name
}

output "cname_piaware_hostname" {
  value = cloudflare_dns_record.cname_piaware.name
}
