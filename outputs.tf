output "account_id" {
  value = cloudflare_account.main.id
}

output "hiroxto_net" {
  value = {
    zone_id = module.hiroxto_net.zone_id
  }
}

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
