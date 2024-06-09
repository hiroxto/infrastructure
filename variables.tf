variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare の API Token"
  sensitive   = true
}

variable "tfe_token" {
  type        = string
  description = "HCP Terraform の Token"
  sensitive   = true
}

variable "newrelic_account_id" {
  type        = number
  description = "New Relic の Account ID"
}

variable "newrelic_api_key" {
  type        = string
  description = "New Relic の API Key"
  sensitive   = true
}

variable "newrelic_region" {
  type        = string
  description = "New Relic の Region"
}

# TODO: Secrets Managerなどのサービスで管理したい
variable "idp_google_client_id" {
  type        = string
  description = "IdP で使う Google の Client ID"
  sensitive   = true
}

# TODO: Secrets Managerなどのサービスで管理したい
variable "idp_google_client_secret" {
  type        = string
  description = "IdP で使う Google の Client ID"
  sensitive   = true
}

variable "admin_gmail_address" {
  type        = string
  description = "管理者の Gmail アドレス"
}

# TODO: Secrets Managerなどのサービスで管理したい
variable "tf_cloud_slack_webhook_url" {
  type        = string
  description = "Slack の Webhook URL"
}
