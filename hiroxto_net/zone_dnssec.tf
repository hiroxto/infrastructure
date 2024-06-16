resource "cloudflare_zone_dnssec" "main" {
  zone_id = data.cloudflare_zone.main.id
}
