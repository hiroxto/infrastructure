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

variable "app_epgstation_domain" {
  type        = string
  description = "Access Application の EPGStation のドメイン"
}

variable "app_eq12_01_ssh_domain" {
  type        = string
  description = "Access Application の EQ12 の SSH 接続のドメイン"
}

variable "app_raspi_4b_01_ssh_domain" {
  type        = string
  description = "Access Application の raspi-4b-01 の SSH 接続のドメイン"
}

variable "app_fr24_feeder_status_domain" {
  type        = string
  description = "Access Application の FR24 Feeder Status のドメイン"
}

variable "app_piaware_domain" {
  type        = string
  description = "Access Application の PiAware のドメイン"
}

variable "app_navidrome_domain" {
  type        = string
  description = "Access Application の Navidrome のドメイン"
}
