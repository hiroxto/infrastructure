#
# New Relic
#
module "observe" {
  source            = "./observe"
  epgstation_uri    = "https://${cloudflare_dns_record.cname_epgstation.name}/api/version"
  cfa_client_id     = cloudflare_zero_trust_access_service_token.new_relic.client_id
  cfa_client_secret = cloudflare_zero_trust_access_service_token.new_relic.client_secret
}
