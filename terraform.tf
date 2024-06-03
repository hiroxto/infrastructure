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
      version = "4.33.0"
    }

    tfe = {
      source  = "hashicorp/tfe"
      version = "0.55.0"
    }
  }
}
