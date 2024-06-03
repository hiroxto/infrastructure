provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "tfe" {
  token = var.tfe_token
}
