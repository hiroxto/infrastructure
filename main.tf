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
  cname_epgstation                       = module.zero_trust.tunnel_eq12_01_cname
  cname_eq12_01_ssh                      = module.zero_trust.tunnel_eq12_01_cname
  cname_raspi_4b_01_ssh                  = module.zero_trust.tunnel_raspi_4b_01_cname
  cname_fr24_feeder_status_domain        = module.zero_trust.tunnel_eq12_01_cname
  cname_piaware_domain                   = module.zero_trust.tunnel_eq12_01_cname
  cname_navidrome_domain                 = module.zero_trust.tunnel_eq12_01_cname
}

#
# Submodules
#
module "notification" {
  source                             = "./notification"
  cloudflare_account_id              = var.cloudflare_account_id
  target_email                       = var.admin_gmail_address
  slack_general_webhook_url          = var.cf_slack_general_webhook_url
  slack_general_webhook_secret       = var.cf_slack_general_webhook_secret
  slack_tunnel_webhook_url           = var.cf_slack_tunnel_webhook_url
  slack_tunnel_webhook_secret        = var.cf_slack_tunnel_webhook_secret
  slack_status_webhook_url           = var.cf_slack_status_webhook_url
  slack_status_webhook_secret        = var.cf_slack_status_webhook_secret
  slack_pages_prod_webhook_url       = var.cf_slack_pages_prod_webhook_url
  slack_pages_prod_webhook_secret    = var.cf_slack_pages_prod_webhook_secret
  slack_pages_preview_webhook_url    = var.cf_slack_pages_preview_webhook_url
  slack_pages_preview_webhook_secret = var.cf_slack_pages_preview_webhook_secret
  pages_project_ids = [
    data.cloudflare_pages_project.swarm_checkin_regulation_checker.canonical_deployment.project_id,
    data.cloudflare_pages_project.utils.canonical_deployment.project_id,
    data.cloudflare_pages_project.hiroxto_net.canonical_deployment.project_id,
    data.cloudflare_pages_project.train_photo_blog.canonical_deployment.project_id,
    data.cloudflare_pages_project.fare_ticket_route_planning.canonical_deployment.project_id,
  ]
}

module "zero_trust" {
  source                        = "./zero_trust"
  cloudflare_account_id         = var.cloudflare_account_id
  admin_gmail_address           = var.admin_gmail_address
  idp_google_client_id          = var.idp_google_client_id
  idp_google_client_secret      = var.idp_google_client_secret
  app_epgstation_domain         = module.hiroxto_net.cname_epgstation_hostname
  app_eq12_01_ssh_domain        = module.hiroxto_net.cname_eq12_01_ssh_hostname
  app_raspi_4b_01_ssh_domain    = module.hiroxto_net.cname_raspi_4b_01_ssh_hostname
  app_fr24_feeder_status_domain = module.hiroxto_net.cname_fr24_feeder_status_hostname
  app_piaware_domain            = module.hiroxto_net.cname_piaware_hostname
  app_navidrome_domain          = module.hiroxto_net.cname_navidrome_hostname
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
  cfa_client_id     = module.zero_trust.cfa_token_new_relic_client_id
  cfa_client_secret = module.zero_trust.cfa_token_new_relic_client_secret
}
