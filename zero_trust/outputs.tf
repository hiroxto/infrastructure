#
# eq12_01
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

output "tunnel_eq12_01_cname" {
  value = "${cloudflare_zero_trust_tunnel_cloudflared.eq12_01.id}.cfargotunnel.com"
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

output "tunnel_raspi_4b_01_cname" {
  value = "${cloudflare_zero_trust_tunnel_cloudflared.raspi_4b_01.id}.cfargotunnel.com"
}

#
# Access Service Tokens
#
output "cfa_token_new_relic_client_id" {
  value     = cloudflare_zero_trust_access_service_token.new_relic.client_id
  sensitive = true
}

output "cfa_token_new_relic_client_secret" {
  value     = cloudflare_zero_trust_access_service_token.new_relic.client_secret
  sensitive = true
}
