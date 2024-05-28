variable "cloudflare_account_id" {
  type        = string
  description = "Cloudflare の Account ID"
}

variable "target_email" {
  type        = string
  description = "メール通知の送信先"
}
