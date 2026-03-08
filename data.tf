#
# Cloudflare
#
data "cloudflare_zone" "hiroxto_net" {
  zone_id = "1c68e572f5d9da0eeb2147cedd370816"
}

data "cloudflare_pages_project" "swarm_checkin_regulation_checker" {
  account_id   = var.cloudflare_account_id
  project_name = "swarm-checkin-regulation-checker"
}

data "cloudflare_pages_project" "train_photo_blog" {
  account_id   = var.cloudflare_account_id
  project_name = "hiroxto-train-photo-blog"
}

data "cloudflare_pages_project" "utils" {
  account_id   = var.cloudflare_account_id
  project_name = "hiroxto-utils-hiroxto-net"
}

data "cloudflare_pages_project" "fare_ticket_route_planning" {
  account_id   = var.cloudflare_account_id
  project_name = "fare-ticket-route-planning"
}

data "cloudflare_zero_trust_tunnel_cloudflared_token" "eq12_01" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.eq12_01.id
}

data "cloudflare_zero_trust_tunnel_cloudflared_token" "raspi_4b_01" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.raspi_4b_01.id
}
