resource "cloudflare_zero_trust_access_organization" "main" {
  auth_domain = "hiroxto.cloudflareaccess.com"
  account_id  = var.cloudflare_account_id
  name        = "hiroxto.cloudflareaccess.com"

  custom_pages {}
  login_design {}
}
