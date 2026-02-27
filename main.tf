#
# Domain modules
#
module "hiroxto_net" {
  source = "./hiroxto_net"

  # General
  zone_id = "1c68e572f5d9da0eeb2147cedd370816"
  name    = "hiroxto.net"

  # Domain
  cname_www                              = data.cloudflare_pages_project.hiroxto_net.subdomain
  cname_swarm_checkin_regulation_checker = data.cloudflare_pages_project.swarm_checkin_regulation_checker.subdomain
  cname_train_photo_blog                 = data.cloudflare_pages_project.train_photo_blog.subdomain
  cname_utils                            = data.cloudflare_pages_project.utils.subdomain
  cname_epgstation                       = local.tunnel_eq12_01_cname
  cname_eq12_01_ssh                      = local.tunnel_eq12_01_cname
  cname_raspi_4b_01_ssh                  = local.tunnel_raspi_4b_01_cname
  cname_fr24_feeder_status_domain        = local.tunnel_eq12_01_cname
  cname_piaware_domain                   = local.tunnel_eq12_01_cname
  cname_navidrome_domain                 = local.tunnel_eq12_01_cname
}

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
  epgstation_uri    = "https://${module.hiroxto_net.cname_epgstation_hostname}/api/version"
  cfa_client_id     = cloudflare_zero_trust_access_service_token.new_relic.client_id
  cfa_client_secret = cloudflare_zero_trust_access_service_token.new_relic.client_secret
}
