resource "cloudflare_zero_trust_organization" "main" {
  account_id  = var.cloudflare_account_id
  auth_domain = "hiroxto.cloudflareaccess.com"
  name        = "hiroxto.cloudflareaccess.com"

  allow_authenticate_via_warp                 = false
  warp_auth_session_duration                  = "24h"
  deny_unmatched_requests                     = false
  deny_unmatched_requests_exempted_zone_names = []

  service_token_inactivity = {
    enabled                   = false
    action                    = "disable"
    inactivity_threshold_days = 90
  }
}
