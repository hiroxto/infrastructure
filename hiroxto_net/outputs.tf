output "zone_id" {
  value = cloudflare_zone.main.id
}

output "records" {
  value = {
    cname_epgstation_hostname      = cloudflare_record.cname_epgstation.hostname
    cname_mirakurun_hostname       = cloudflare_record.cname_mirakurun.hostname
    cname_raspi_4b_01_ssh_hostname = cloudflare_record.cname_raspi_4b_01_ssh.hostname
    cname_eq12_01_ssh_hostname     = cloudflare_record.cname_eq12_01_ssh.hostname
  }
}
