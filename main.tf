#
# HCP Terraform (Terraform Cloud)
#
module "tf_cloud" {
  source            = "./tf_cloud"
  tfe_workspace_id  = data.tfe_workspace.main.id
  slack_webhook_url = var.tf_cloud_slack_webhook_url
}

#
# New Relic
#
module "observe" {
  source            = "./observe"
  epgstation_uri    = "https://${cloudflare_dns_record.cname_epgstation.name}/api/version"
  cfa_client_id     = cloudflare_zero_trust_access_service_token.new_relic.client_id
  cfa_client_secret = cloudflare_zero_trust_access_service_token.new_relic.client_secret
}
