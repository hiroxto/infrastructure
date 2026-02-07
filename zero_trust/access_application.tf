#
# eq12-01
#
resource "cloudflare_zero_trust_access_application" "eq12_01_ssh" {
  account_id           = var.cloudflare_account_id
  name                 = "eq12-01-ssh"
  domain               = var.app_eq12_01_ssh_domain
  type                 = "ssh"
  app_launcher_visible = false
  destinations = [
    {
      type = "public"
      uri  = var.app_eq12_01_ssh_domain
    }
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.google.id,
  ]
  policies = [
    {
      id         = cloudflare_zero_trust_access_policy.admin.id
      precedence = 1
    }
  ]
  session_duration = "8h"
}

#
# raspi-4b-01
#
resource "cloudflare_zero_trust_access_application" "raspi_4b_01_ssh" {
  account_id           = var.cloudflare_account_id
  name                 = "raspi-4b-01-ssh"
  domain               = var.app_raspi_4b_01_ssh_domain
  type                 = "ssh"
  app_launcher_visible = false
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.google.id,
  ]
  policies = [
    {
      id         = cloudflare_zero_trust_access_policy.admin.id
      precedence = 1
    }
  ]
  session_duration = "8h"
}

#
# Web application
#
resource "cloudflare_zero_trust_access_application" "epgstation" {
  account_id           = var.cloudflare_account_id
  name                 = "EPGStation"
  domain               = var.app_epgstation_domain
  type                 = "self_hosted"
  app_launcher_visible = true
  destinations = [
    {
      type = "public"
      uri  = var.app_epgstation_domain
    }
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.google.id,
  ]
  policies = [
    {
      id         = cloudflare_zero_trust_access_policy.admin.id
      precedence = 1
    },
    {
      id         = cloudflare_zero_trust_access_policy.new_relic.id
      precedence = 2
    },
  ]
  auto_redirect_to_identity  = false
  session_duration           = "720h" # 30 days
  same_site_cookie_attribute = "lax"
  http_only_cookie_attribute = true
  enable_binding_cookie      = false
  service_auth_401_redirect  = true
  options_preflight_bypass   = true
}

resource "cloudflare_zero_trust_access_application" "fr24_feeder_status" {
  account_id           = var.cloudflare_account_id
  name                 = "FR24 Feeder Status"
  domain               = var.app_fr24_feeder_status_domain
  type                 = "self_hosted"
  app_launcher_visible = true
  destinations = [
    {
      type = "public"
      uri  = var.app_fr24_feeder_status_domain
    }
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.google.id,
  ]
  policies = [
    {
      id         = cloudflare_zero_trust_access_policy.admin.id
      precedence = 1
    },
  ]
  auto_redirect_to_identity  = false
  session_duration           = "720h" # 30 days
  same_site_cookie_attribute = "lax"
  http_only_cookie_attribute = true
  enable_binding_cookie      = false
  service_auth_401_redirect  = true
  options_preflight_bypass   = false
}

resource "cloudflare_zero_trust_access_application" "piaware" {
  account_id           = var.cloudflare_account_id
  name                 = "PiAware"
  domain               = var.app_piaware_domain
  type                 = "self_hosted"
  app_launcher_visible = true
  destinations = [
    {
      type = "public"
      uri  = var.app_piaware_domain
    }
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.google.id,
  ]
  policies = [
    {
      id         = cloudflare_zero_trust_access_policy.admin.id
      precedence = 1
    },
  ]
  auto_redirect_to_identity  = false
  session_duration           = "720h" # 30 days
  same_site_cookie_attribute = "lax"
  http_only_cookie_attribute = true
  enable_binding_cookie      = false
  service_auth_401_redirect  = true
  options_preflight_bypass   = false
}

resource "cloudflare_zero_trust_access_application" "navidrome" {
  account_id           = var.cloudflare_account_id
  name                 = "Navidrome"
  domain               = var.app_navidrome_domain
  type                 = "self_hosted"
  app_launcher_visible = true
  destinations = [
    {
      type = "public"
      uri  = var.app_navidrome_domain
    }
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.google.id,
  ]
  policies = [
    {
      id         = cloudflare_zero_trust_access_policy.admin.id
      precedence = 1
    },
  ]
  auto_redirect_to_identity  = false
  session_duration           = "720h" # 30 days
  same_site_cookie_attribute = "lax"
  http_only_cookie_attribute = true
  enable_binding_cookie      = false
  service_auth_401_redirect  = true
  options_preflight_bypass   = false
}
