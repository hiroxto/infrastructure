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

variable "slack_tunnel_webhook_url" {
  type        = string
  description = "Cloudflare Tunnel 関連の Slack 通知の Webhook URL"
}

variable "slack_status_webhook_url" {
  type        = string
  description = "Cloudflare のステータス関連の Slack 通知の Webhook URL"
}

variable "slack_pages_webhook_url" {
  type        = string
  description = "Cloudflare Pages 関連の Slack 通知の Webhook URL"
}

