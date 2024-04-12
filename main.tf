module "hiroxto_net" {
  source                = "./hiroxto_net"
  cloudflare_zone_id    = "1c68e572f5d9da0eeb2147cedd370816"
  cloudflare_account_id = "85fae46d15f3eb163074860b692a91d0"
  domain_name           = "hiroxto.net"
}
