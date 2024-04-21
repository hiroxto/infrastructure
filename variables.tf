variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare の API Token"
  sensitive   = true
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

# TODO: Secrets Managerなどのサービスで管理したい
variable "tunnel_epgstation_secret" {
  type        = string
  description = "EPGStation の Tunnel の Secret"
  sensitive   = true
}
