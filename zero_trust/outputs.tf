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
  value = cloudflare_tunnel.eq12_01.cname
}

#
# Access Service Tokens
#
output "access_service_token_new_relic_client_id" {
  value     = cloudflare_access_service_token.new_relic.client_id
  sensitive = true
}

output "access_service_token_new_relic_client_secret" {
  value     = cloudflare_access_service_token.new_relic.client_secret
  sensitive = true
}
