resource "cloudflare_zone_dnssec" "main" {
  zone_id = cloudflare_zone.main.id
}
