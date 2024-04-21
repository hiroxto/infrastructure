resource "cloudflare_access_identity_provider" "google" {
  account_id = cloudflare_account.main.id
  name       = "Google"
  type       = "google"

  config {
    client_id     = var.idp_google_client_id
    client_secret = var.idp_google_client_secret
  }
}
