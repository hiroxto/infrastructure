provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "tfe" {
  token = var.tfe_token
}

provider "newrelic" {
  account_id = var.newrelic_account_id
  api_key    = var.newrelic_api_key
  region     = var.newrelic_region
}
