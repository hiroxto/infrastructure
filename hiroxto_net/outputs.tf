output "account_id" {
  value = var.cloudflare_account_id
}

output "zone_id" {
  value = cloudflare_zone.main.id
}
