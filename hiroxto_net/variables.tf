variable "cloudflare_account_id" {
  type        = string
  description = "Cloudflare の Account ID"
}

variable "name" {
  type        = string
  description = "対象のドメイン名"
}

variable "email_routing_addresses" {
  type = object({
    catch_all            = string
    forward_me_to_gmail  = string
    forward_bot_to_gmail = string
  })
  description = "メール転送先アドレス"
}

variable "records" {
  type = object({
    cname_root             = string
    cname_www              = string
    cname_train_photo_blog = string
    cname_epgstation       = string
    cname_eq12_01_ssh      = string
    cname_home_assistant   = string
  })
  description = "DNSレコードの設定"
}
