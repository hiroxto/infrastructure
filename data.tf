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
