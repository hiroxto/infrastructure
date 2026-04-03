#
# Cloudflare
#
data "cloudflare_zone" "hiroxto_net" {
  zone_id = "1c68e572f5d9da0eeb2147cedd370816"
}

data "cloudflare_pages_project" "train_photo_blog" {
  account_id   = var.cloudflare_account_id
  project_name = "hiroxto-train-photo-blog"
}

data "cloudflare_zero_trust_tunnel_cloudflared_token" "eq12_01" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.eq12_01.id
}

data "cloudflare_zero_trust_tunnel_cloudflared_token" "raspi_4b_01" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.raspi_4b_01.id
}

data "cloudflare_zero_trust_access_identity_provider" "onetimepin" {
  account_id           = var.cloudflare_account_id
  identity_provider_id = "61e47328-e71c-4b1c-b702-f126b01d5e50"
}

data "cloudflare_zero_trust_access_identity_provider" "google" {
  account_id           = var.cloudflare_account_id
  identity_provider_id = "7e9d46f7-1018-47f2-8454-07f7ca9dfe47"
}
