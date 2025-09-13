variable "cloudflare_account_id" {
  type        = string
  description = "Cloudflare の Account ID"
}

variable "target_email" {
  type        = string
  description = "メール通知の送信先"
}

variable "slack_general_webhook_url" {
  type        = string
  description = "Cloudflare の全般的な Slack 通知の Webhook URL"
}

variable "slack_general_webhook_secret" {
  type        = string
  description = "Cloudflare の全般的な Slack 通知の Webhook Secret"
}

variable "slack_tunnel_webhook_url" {
  type        = string
  description = "Cloudflare Tunnel 関連の Slack 通知の Webhook URL"
}

variable "slack_tunnel_webhook_secret" {
  type        = string
  description = "Cloudflare Tunnel 関連の Slack 通知の Webhook Secret"
}

variable "slack_status_webhook_url" {
  type        = string
  description = "Cloudflare のステータス関連の Slack 通知の Webhook URL"
}

variable "slack_status_webhook_secret" {
  type        = string
  description = "Cloudflare のステータス関連の Slack 通知の Webhook Secret"
}

variable "slack_pages_prod_webhook_url" {
  type        = string
  description = "本番環境の Cloudflare Pages 関連の Slack 通知の Webhook URL"
}

variable "slack_pages_prod_webhook_secret" {
  type        = string
  description = "本番環境の Cloudflare Pages 関連の Slack 通知の Webhook Secret"
}

variable "slack_pages_preview_webhook_url" {
  type        = string
  description = "プレビュー環境の Cloudflare Pages 関連の Slack 通知の Webhook URL"
}

variable "slack_pages_preview_webhook_secret" {
  type        = string
  description = "プレビュー環境の Cloudflare Pages 関連の Slack 通知の Webhook Secret"
}

variable "pages_project_ids" {
  type        = list(string)
  description = "通知対象のCloudflare PagesのプロジェクトID"
}
