resource "cloudflare_zero_trust_access_service_token" "navidrome_music" {
  account_id = var.cloudflare_account_id
  name       = "Navidrome Music"
  duration   = "forever"
}
