output "account_id" {
  value = var.cloudflare_account_id
}

output "hiroxto_net" {
  value = {
    zone_id = module.hiroxto_net.zone_id
  }
}

#
# eq12-01
#
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

#
# raspi-4b-01
#
output "tunnel_raspi_4b_01_id" {
  value = module.zero_trust.tunnel_raspi_4b_01_id
}

output "tunnel_raspi_4b_01_secret" {
  value     = module.zero_trust.tunnel_raspi_4b_01_secret
  sensitive = true
}

output "tunnel_raspi_4b_01_token" {
  value     = module.zero_trust.tunnel_raspi_4b_01_token
  sensitive = true
}
