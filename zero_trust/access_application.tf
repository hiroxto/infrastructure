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
    cloudflare_access_policy.admin.id
  ]
  auto_redirect_to_identity  = false
  session_duration           = "168h" # 1 weeks
  same_site_cookie_attribute = "lax"
  http_only_cookie_attribute = true
  enable_binding_cookie      = false
  service_auth_401_redirect  = true
}

resource "cloudflare_access_application" "mirakurun" {
  account_id           = var.cloudflare_account_id
  name                 = "Mirakurun"
  domain               = var.app_mirakurun_domain
  type                 = "self_hosted"
  app_launcher_visible = true
  allowed_idps = [
    cloudflare_access_identity_provider.google.id,
  ]
  policies = [
    cloudflare_access_policy.admin.id
  ]
  auto_redirect_to_identity  = false
  session_duration           = "168h" # 1 weeks
  same_site_cookie_attribute = "lax"
  http_only_cookie_attribute = true
  enable_binding_cookie      = false
  service_auth_401_redirect  = true
}

resource "cloudflare_access_application" "raspi_4b_01_ssh" {
  account_id           = var.cloudflare_account_id
  name                 = "raspi-4b-01-ssh"
  domain               = var.app_raspi_4b_01_ssh_domain
  type                 = "ssh"
  app_launcher_visible = false
  allowed_idps = [
    cloudflare_access_identity_provider.google.id,
  ]
  policies = [
    cloudflare_access_policy.admin.id
  ]
}
