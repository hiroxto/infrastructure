#
# raspi_4b_01
#
output "tunnel_raspi_4b_01_id" {
  value = cloudflare_tunnel.raspi_4b_01.id
}

output "tunnel_raspi_4b_01_secret" {
  value     = cloudflare_tunnel.raspi_4b_01.secret
  sensitive = true
}

output "tunnel_raspi_4b_01_token" {
  value     = cloudflare_tunnel.raspi_4b_01.tunnel_token
  sensitive = true
}

#
# eq12_01
#
output "tunnel_eq12_01_id" {
  value = cloudflare_tunnel.eq12_01.id
}

output "tunnel_eq12_01_secret" {
  value     = cloudflare_tunnel.eq12_01.secret
  sensitive = true
}

output "tunnel_eq12_01_token" {
  value     = cloudflare_tunnel.eq12_01.tunnel_token
  sensitive = true
}

output "tunnel_eq12_01_cname" {
  value = cloudflare_tunnel.eq12_01.cname
}


#
# CNAME
#
output "tunnel_epgstation_cname" {
  value = cloudflare_tunnel.raspi_4b_01.cname
}

output "tunnel_mirakurun_cname" {
  value = cloudflare_tunnel.raspi_4b_01.cname
}

output "tunnel_raspi_4b_01_cname" {
  value = cloudflare_tunnel.raspi_4b_01.cname
}
