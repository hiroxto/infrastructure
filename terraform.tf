terraform {
  required_version = ">= 1.7.0"

  cloud {
    organization = "hiroxto"
    workspaces {
      name = "infrastructure"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.5.0"
    }

    tfe = {
      source  = "hashicorp/tfe"
      version = "0.57.1"
    }

    newrelic = {
      source  = "newrelic/newrelic"
      version = "3.54.0"
    }
  }
}
