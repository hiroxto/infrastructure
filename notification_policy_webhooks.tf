resource "cloudflare_notification_policy_webhooks" "slack" {
  account_id = cloudflare_account.main.id
  name       = "Cloudflare Notification"
  url        = "https://hooks.slack.com/services/T016EEV6MU3/B06UD82EPJ6"
}

resource "cloudflare_notification_policy_webhooks" "slack_tunnel" {
  account_id = cloudflare_account.main.id
  name       = "Cloudflare Tunnel Notification"
  url        = "https://hooks.slack.com/services/T016EEV6MU3/B070B67DC3E"
}

resource "cloudflare_notification_policy_webhooks" "slack_status" {
  account_id = cloudflare_account.main.id
  name       = "Cloudflare Status Notification"
  url        = "https://hooks.slack.com/services/T016EEV6MU3/B0708PFRT6E"
}
