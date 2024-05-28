output "tunnel_raspi_4b_01_id" {
  value = cloudflare_tunnel.raspi_4b_01.id
}

output "tunnel_epgstation_cname" {
  value = cloudflare_tunnel.raspi_4b_01.cname
}

output "tunnel_raspi_4b_01_cname" {
  value = cloudflare_tunnel.raspi_4b_01.cname
}

output "tunnel_raspi_4b_01_secret" {
  value     = cloudflare_tunnel.raspi_4b_01.secret
  sensitive = true
}

output "tunnel_raspi_4b_01_token" {
  value     = cloudflare_tunnel.raspi_4b_01.tunnel_token
  sensitive = true
}
