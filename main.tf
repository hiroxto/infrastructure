module "hiroxto_net" {
  source                = "./hiroxto_net"
  cloudflare_account_id = cloudflare_account.main.id
  email_routing_addresses = {
    catch_all            = cloudflare_email_routing_address.main_gmail.email
    forward_me_to_gmail  = cloudflare_email_routing_address.main_gmail.email
    forward_bot_to_gmail = cloudflare_email_routing_address.main_gmail.email
  }
  records = {
    cname_epgstation = cloudflare_tunnel.epgstation.cname
  }
}
