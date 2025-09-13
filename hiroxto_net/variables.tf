#
# General
#
variable "zone_id" {
  type        = string
  description = "Zone ID"
}

variable "name" {
  type        = string
  description = "対象のドメイン名"
}

#
# Email
#
variable "email_catch_all_forward_to" {
  type        = string
  description = "Catch all の転送先メールアドレス"
}

variable "email_me_forward_to" {
  type        = string
  description = "me アドレスの転送先メールアドレス"
}

variable "email_bot_forward_to" {
  type        = string
  description = "me アドレスの転送先メールアドレス"
}

#
# Domain
#
variable "cname_www" {
  type        = string
  description = "www ドメインの CNAME の値"
}

variable "cname_swarm_checkin_regulation_checker" {
  type        = string
  description = "swarm-checkin-regulation-checker ドメインの CNAME の値"
}

variable "cname_train_photo_blog" {
  type        = string
  description = "train-photo-blog ドメインの CNAME の値"
}

variable "cname_utils" {
  type        = string
  description = "utils ドメインの CNAME の値"
}

variable "cname_eq12_01_ssh" {
  type        = string
  description = "eq12-01-ssh ドメインの CNAME の値"
}

variable "cname_raspi_4b_01_ssh" {
  type        = string
  description = "raspi-4b-01-ssh ドメインの CNAME の値"
}

variable "cname_epgstation" {
  type        = string
  description = "epgstation ドメインの CNAME の値"
}

variable "cname_fr24_feeder_status_domain" {
  type        = string
  description = "fr24-feeder-status ドメインの CNAME の値"
}

variable "cname_piaware_domain" {
  type        = string
  description = "PiAware ドメインの CNAME の値"
}
