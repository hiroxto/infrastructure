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

output "navidrome_music_headers" {
  description = "Navidrome Music の Access 認証に使用するカスタムヘッダー"
  value = {
    "CF-Access-Client-Id"     = cloudflare_zero_trust_access_service_token.navidrome_music.client_id
    "CF-Access-Client-Secret" = cloudflare_zero_trust_access_service_token.navidrome_music.client_secret
  }
  sensitive = true
}
