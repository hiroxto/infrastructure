resource "cloudflare_zero_trust_access_identity_provider" "onetimepin" {
  account_id = var.cloudflare_account_id
  name       = "One-time PIN"
  type       = "onetimepin"
}

resource "cloudflare_zero_trust_access_identity_provider" "google" {
  account_id = var.cloudflare_account_id
  name       = "Google"
  type       = "google"

  config {
    client_id     = var.idp_google_client_id
    client_secret = var.idp_google_client_secret
  }
}
