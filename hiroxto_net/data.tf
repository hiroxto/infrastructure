data "cloudflare_zone" "main" {
  account_id = var.cloudflare_account_id
  name       = var.name
}

data "cloudflare_zone_dnssec" "main" {
  zone_id = data.cloudflare_zone.main.id
}
