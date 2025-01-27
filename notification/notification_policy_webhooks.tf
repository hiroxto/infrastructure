resource "cloudflare_notification_policy_webhooks" "slack" {
  account_id = var.cloudflare_account_id
  name       = "Cloudflare Notification"
  url        = var.slack_general_webhook_url
  secret     = var.slack_general_webhook_secret
}

resource "cloudflare_notification_policy_webhooks" "slack_tunnel" {
  account_id = var.cloudflare_account_id
  name       = "Cloudflare Tunnel event"
  url        = var.slack_tunnel_webhook_url
  secret     = var.slack_tunnel_webhook_secret
}

resource "cloudflare_notification_policy_webhooks" "slack_status" {
  account_id = var.cloudflare_account_id
  name       = "Cloudflare Status"
  url        = var.slack_status_webhook_url
  secret     = var.slack_status_webhook_secret
}

resource "cloudflare_notification_policy_webhooks" "slack_pages_prod" {
  account_id = var.cloudflare_account_id
  name       = "Cloudflare Pages Production deployment"
  url        = var.slack_pages_prod_webhook_url
  secret     = var.slack_pages_prod_webhook_secret
}

resource "cloudflare_notification_policy_webhooks" "slack_pages_preview" {
  account_id = var.cloudflare_account_id
  name       = "Cloudflare Pages Preview deployment"
  url        = var.slack_pages_preview_webhook_url
  secret     = var.slack_pages_preview_webhook_secret
}
