resource "cloudflare_access_application" "epgstation" {
  account_id           = var.cloudflare_account_id
  name                 = "EPGStation"
  domain               = var.app_epgstation_domain
  type                 = "self_hosted"
  app_launcher_visible = true
  allowed_idps = [
    cloudflare_access_identity_provider.google.id,
  ]
  policies = [
    cloudflare_access_policy.admin.id,
    # cloudflare_access_policy.new_relic.id
  ]
  auto_redirect_to_identity  = false
  session_duration           = "168h" # 1 weeks
  same_site_cookie_attribute = "lax"
  http_only_cookie_attribute = true
  enable_binding_cookie      = false
  service_auth_401_redirect  = true
  options_preflight_bypass   = true
}

resource "cloudflare_access_application" "eq12_01_ssh" {
  account_id           = var.cloudflare_account_id
  name                 = "eq12-01-ssh"
  domain               = var.app_eq12_01_ssh_domain
  type                 = "ssh"
  app_launcher_visible = false
  allowed_idps = [
    cloudflare_access_identity_provider.google.id,
  ]
  policies = [
    cloudflare_access_policy.admin.id
  ]
}
