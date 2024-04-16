variable "cloudflare_account_id" {
  type        = string
  description = "Cloudflare の Account ID"
}

variable "email_routing_addresses" {
  type = object({
    forward_me_to_gmail = string
  })
  description = "メール転送先アドレス"
}
