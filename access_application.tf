resource "cloudflare_access_application" "epgstation" {
  account_id           = cloudflare_account.main.id
  name                 = "EPGStation"
  domain               = module.hiroxto_net.records.cname_epgstation_hostname
  type                 = "self_hosted"
  app_launcher_visible = true
  allowed_idps = [
    cloudflare_access_identity_provider.onetimepin.id,
    cloudflare_access_identity_provider.google.id,
  ]
  auto_redirect_to_identity = true
  session_duration          = "168h" # 1 weeks
}
