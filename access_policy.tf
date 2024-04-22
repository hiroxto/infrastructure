resource "cloudflare_access_policy" "epgstation" {
  application_id = cloudflare_access_application.epgstation.id
  account_id     = cloudflare_account.main.id
  name           = "EPGStation"
  decision       = "allow"
  precedence     = 1

  include {
    group = [cloudflare_access_group.epgstation.id]
  }
}
