module "hiroxto_net" {
  source                = "./hiroxto_net"
  cloudflare_account_id = cloudflare_account.main.id
}
