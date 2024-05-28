#
# Domain modules
#
module "hiroxto_net" {
  source                = "./hiroxto_net"
  cloudflare_account_id = cloudflare_account.main.id
  email_routing_addresses = {
    catch_all            = cloudflare_email_routing_address.main_gmail.email
    forward_me_to_gmail  = cloudflare_email_routing_address.main_gmail.email
    forward_bot_to_gmail = cloudflare_email_routing_address.main_gmail.email
  }
  records = {
    cname_epgstation      = module.zero_trust.tunnel_epgstation_cname
    cname_raspi_4b_01_ssh = module.zero_trust.tunnel_raspi_4b_01_cname
  }
}

#
# Submodules
#
module "notification" {
  source                = "./notification"
  cloudflare_account_id = cloudflare_account.main.id
  target_email          = var.admin_gmail_address
}

module "pages" {
  source                = "./pages"
  cloudflare_account_id = cloudflare_account.main.id
}

module "zero_trust" {
  source                     = "./zero_trust"
  cloudflare_account_id      = cloudflare_account.main.id
  admin_gmail_address        = var.admin_gmail_address
  idp_google_client_id       = var.idp_google_client_id
  idp_google_client_secret   = var.idp_google_client_secret
  tunnel_epgstation_secret   = var.tunnel_epgstation_secret
  app_epgstation_domain      = module.hiroxto_net.records.cname_epgstation_hostname
  app_raspi_4b_01_ssh_domain = module.hiroxto_net.records.cname_raspi_4b_01_ssh_hostname
}
