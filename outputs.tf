output "account_id" {
  value = var.cloudflare_account_id
}

output "hiroxto_net" {
  value = {
    zone_id = data.cloudflare_zone.hiroxto_net.zone_id
  }
}

#
# eq12-01
#
output "tunnel_eq12_01_id" {
  value = cloudflare_zero_trust_tunnel_cloudflared.eq12_01.id
}

output "tunnel_eq12_01_secret" {
  value     = cloudflare_zero_trust_tunnel_cloudflared.eq12_01.tunnel_secret
  sensitive = true
}

output "tunnel_eq12_01_token" {
  value     = data.cloudflare_zero_trust_tunnel_cloudflared_token.eq12_01
  sensitive = true
}

#
# raspi-4b-01
#
output "tunnel_raspi_4b_01_id" {
  value = cloudflare_zero_trust_tunnel_cloudflared.raspi_4b_01.id
}

output "tunnel_raspi_4b_01_secret" {
  value     = cloudflare_zero_trust_tunnel_cloudflared.raspi_4b_01.tunnel_secret
  sensitive = true
}

output "tunnel_raspi_4b_01_token" {
  value     = data.cloudflare_zero_trust_tunnel_cloudflared_token.raspi_4b_01.token
  sensitive = true
}
