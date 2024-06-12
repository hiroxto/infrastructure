variable "epgstation_uri" {
  type        = string
  description = "EPGStation の URI"
}

variable "cfa_client_id" {
  type        = string
  description = "Cloudflare Access の Client ID"
  sensitive   = true
}

variable "cfa_client_secret" {
  type        = string
  description = "Cloudflare Access の Client Secret"
  sensitive   = true
}
