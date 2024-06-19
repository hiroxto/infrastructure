resource "cloudflare_notification_policy_webhooks" "slack" {
  account_id = var.cloudflare_account_id
  name       = "Cloudflare Notification"
  url        = var.slack_general_webhook_url
}

resource "cloudflare_notification_policy_webhooks" "slack_tunnel" {
  account_id = var.cloudflare_account_id
  name       = "Cloudflare Tunnel Notification"
  url        = var.slack_tunnel_webhook_url
}

resource "cloudflare_notification_policy_webhooks" "slack_status" {
  account_id = var.cloudflare_account_id
  name       = "Cloudflare Status Notification"
  url        = var.slack_status_webhook_url
}

resource "cloudflare_notification_policy_webhooks" "slack_pages" {
  account_id = var.cloudflare_account_id
  name       = "Cloudflare Pages Notification"
  url        = var.slack_pages_webhook_url
}
