#
# Domain modules
#
module "hiroxto_net" {
  source                = "./hiroxto_net"
  cloudflare_account_id = cloudflare_account.main.id
  name                  = "hiroxto.net"
  email_routing_addresses = {
    catch_all            = cloudflare_email_routing_address.main_gmail.email
    forward_me_to_gmail  = cloudflare_email_routing_address.main_gmail.email
    forward_bot_to_gmail = cloudflare_email_routing_address.main_gmail.email
  }
  records = {
    cname_root             = module.pages.hiroxto_net_subdomain
    cname_www              = module.pages.hiroxto_net_subdomain
    cname_train_photo_blog = module.pages.train_photo_blog_subdomain
    cname_epgstation       = module.zero_trust.tunnel_epgstation_cname
    cname_eq12_01_ssh      = module.zero_trust.tunnel_eq12_01_cname
  }
}

#
# Submodules
#
module "notification" {
  source                       = "./notification"
  cloudflare_account_id        = cloudflare_account.main.id
  target_email                 = var.admin_gmail_address
  slack_general_webhook_url    = var.cf_slack_general_webhook_url
  slack_general_webhook_secret = var.cf_slack_general_webhook_secret
  slack_tunnel_webhook_url     = var.cf_slack_tunnel_webhook_url
  slack_tunnel_webhook_secret  = var.cf_slack_tunnel_webhook_secret
  slack_status_webhook_url     = var.cf_slack_status_webhook_url
  slack_status_webhook_secret  = var.cf_slack_status_webhook_secret
  slack_pages_webhook_url      = var.cf_slack_pages_webhook_url
  slack_pages_webhook_secret   = var.cf_slack_pages_webhook_secret
}

module "pages" {
  source                = "./pages"
  cloudflare_account_id = cloudflare_account.main.id
}

module "zero_trust" {
  source                   = "./zero_trust"
  cloudflare_account_id    = cloudflare_account.main.id
  admin_gmail_address      = var.admin_gmail_address
  idp_google_client_id     = var.idp_google_client_id
  idp_google_client_secret = var.idp_google_client_secret
  app_epgstation_domain    = module.hiroxto_net.records.cname_epgstation_hostname
  app_eq12_01_ssh_domain   = module.hiroxto_net.records.cname_eq12_01_ssh_hostname
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
  epgstation_uri    = "https://${module.hiroxto_net.records.cname_epgstation_hostname}/api/version"
  cfa_client_id     = module.zero_trust.cfa_token_new_relic_client_id
  cfa_client_secret = module.zero_trust.cfa_token_new_relic_client_secret
}
