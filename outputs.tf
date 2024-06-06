output "account_id" {
  value = cloudflare_account.main.id
}

output "hiroxto_net" {
  value = {
    zone_id = module.hiroxto_net.zone_id
  }
}

output "tunnel_eq12_01_id" {
  value = module.zero_trust.tunnel_eq12_01_id
}

output "tunnel_eq12_01_secret" {
  value     = module.zero_trust.tunnel_eq12_01_secret
  sensitive = true
}

output "tunnel_eq12_01_token" {
  value     = module.zero_trust.tunnel_eq12_01_token
  sensitive = true
}
