#
# Cloudflare
#
data "cloudflare_pages_project" "hiroxto_net" {
  account_id   = var.cloudflare_account_id
  project_name = "hiroxto-net"
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

#
# HCP Terraform
#
data "tfe_organization" "main" {
  name = "hiroxto"
}

data "tfe_workspace" "main" {
  name         = "infrastructure"
  organization = data.tfe_organization.main.name
}
