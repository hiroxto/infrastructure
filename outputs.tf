output "account_id" {
  value = cloudflare_account.main.id
}

output "hiroxto_net" {
  value = {
    zone_id = module.hiroxto_net.zone_id
  }
}
