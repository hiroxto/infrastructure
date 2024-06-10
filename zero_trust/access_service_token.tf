resource "cloudflare_access_service_token" "new_relic" {
  account_id = var.cloudflare_account_id
  name       = "New Relic"
  duration   = "forever"
}
