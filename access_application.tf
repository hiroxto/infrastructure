#
# eq12-01
#
resource "cloudflare_zero_trust_access_application" "eq12_01_ssh" {
  account_id           = var.cloudflare_account_id
  name                 = "eq12-01-ssh"
  domain               = cloudflare_dns_record.cname_eq12_01_ssh.name
  type                 = "ssh"
  app_launcher_visible = false
  destinations = [
    {
      type = "public"
      uri  = cloudflare_dns_record.cname_eq12_01_ssh.name
    }
  ]
  allowed_idps = [
    data.cloudflare_zero_trust_access_identity_provider.google.id,
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
  domain               = cloudflare_dns_record.cname_raspi_4b_01_ssh.name
  type                 = "ssh"
  app_launcher_visible = false
  allowed_idps = [
    data.cloudflare_zero_trust_access_identity_provider.google.id,
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
  domain               = cloudflare_dns_record.cname_epgstation.name
  type                 = "self_hosted"
  app_launcher_visible = true
  destinations = [
    {
      type = "public"
      uri  = cloudflare_dns_record.cname_epgstation.name
    }
  ]
  allowed_idps = [
    data.cloudflare_zero_trust_access_identity_provider.google.id,
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
  options_preflight_bypass   = true
}

resource "cloudflare_zero_trust_access_application" "fr24_feeder_status" {
  account_id           = var.cloudflare_account_id
  name                 = "FR24 Feeder Status"
  domain               = cloudflare_dns_record.cname_fr24_feeder_status_domain.name
  type                 = "self_hosted"
  app_launcher_visible = true
  destinations = [
    {
      type = "public"
      uri  = cloudflare_dns_record.cname_fr24_feeder_status_domain.name
    }
  ]
  allowed_idps = [
    data.cloudflare_zero_trust_access_identity_provider.google.id,
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
  domain               = cloudflare_dns_record.cname_piaware.name
  type                 = "self_hosted"
  app_launcher_visible = true
  destinations = [
    {
      type = "public"
      uri  = cloudflare_dns_record.cname_piaware.name
    }
  ]
  allowed_idps = [
    data.cloudflare_zero_trust_access_identity_provider.google.id,
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
  domain               = cloudflare_dns_record.cname_navidrome.name
  type                 = "self_hosted"
  app_launcher_visible = true
  destinations = [
    {
      type = "public"
      uri  = cloudflare_dns_record.cname_navidrome.name
    }
  ]
  allowed_idps = [
    data.cloudflare_zero_trust_access_identity_provider.google.id,
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
