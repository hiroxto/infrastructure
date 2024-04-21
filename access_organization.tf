resource "cloudflare_access_organization" "main" {
  auth_domain = "hiroxto.cloudflareaccess.com"
  account_id  = cloudflare_account.main.id
  name        = "hiroxto.cloudflareaccess.com"

  login_design {}
}
