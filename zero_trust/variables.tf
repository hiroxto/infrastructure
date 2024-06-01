variable "cloudflare_account_id" {
  type        = string
  description = "Cloudflare の Account ID"
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

variable "tunnel_epgstation_secret" {
  type        = string
  description = "EPGStation の Tunnel の Secret"
  sensitive   = true
}

variable "app_epgstation_domain" {
  type        = string
  description = "Access Application の EPGStation のドメイン"
}

variable "app_mirakurun_domain" {
  type        = string
  description = "Access Application の Mirakurun のドメイン"
}

variable "app_raspi_4b_01_ssh_domain" {
  type        = string
  description = "Access Application の raspi-4b-01 の SSH 接続のドメイン"
}
