resource "cloudflare_access_organization" "main" {
  auth_domain = "hiroxto.cloudflareaccess.com"
  account_id  = var.cloudflare_account_id
  name        = "hiroxto.cloudflareaccess.com"

  login_design {}
}
