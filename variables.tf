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

variable "admin_gmail_address" {
  type        = string
  description = "管理者の Gmail アドレス"
}

variable "idp_google_client_id" {
  type        = string
  description = "IdP で使う Google の Client ID"
  sensitive   = true
}

variable "idp_google_client_secret" {
  type        = string
  description = "IdP で使う Google の Client ID"
  sensitive   = true
}

variable "tf_cloud_slack_webhook_url" {
  type        = string
  description = "Slack の Webhook URL"
}

variable "cf_slack_general_webhook_url" {
  type        = string
  description = "Cloudflare の全般的な Slack 通知の Webhook URL"
}

variable "cf_slack_general_webhook_secret" {
  type        = string
  description = "Cloudflare の全般的な Slack 通知の Webhook Secret"
}

variable "cf_slack_tunnel_webhook_url" {
  type        = string
  description = "Cloudflare Tunnel 関連の Slack 通知の Webhook URL"
}

variable "cf_slack_tunnel_webhook_secret" {
  type        = string
  description = "Cloudflare Tunnel 関連の Slack 通知の Webhook Secret"
}

variable "cf_slack_status_webhook_url" {
  type        = string
  description = "Cloudflare のステータス関連の Slack 通知の Webhook URL"
}

variable "cf_slack_status_webhook_secret" {
  type        = string
  description = "Cloudflare のステータス関連の Slack 通知の Webhook Secret"
}

variable "cf_slack_pages_prod_webhook_url" {
  type        = string
  description = "本番環境の Cloudflare Pages 関連の Slack 通知の Webhook URL"
}

variable "cf_slack_pages_prod_webhook_secret" {
  type        = string
  description = "本番環境の Cloudflare Pages 関連の Slack 通知の Webhook Secret"
}

variable "cf_slack_pages_preview_webhook_url" {
  type        = string
  description = "プレビュー環境の Cloudflare Pages 関連の Slack 通知の Webhook URL"
}

variable "cf_slack_pages_preview_webhook_secret" {
  type        = string
  description = "プレビュー環境の Cloudflare Pages 関連の Slack 通知の Webhook Secret"
}
