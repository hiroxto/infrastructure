# NOTE secret の管理を避けるため， Web で作成後に import している。将来的には url と secret を Secrets Store で管理したい。
# FIXME url をハードコーディングを解消したい

resource "cloudflare_notification_policy_webhooks" "slack" {
  account_id = var.cloudflare_account_id
  name       = "Cloudflare Notification"
  url        = "https://hooks.slack.com/services/T016EEV6MU3/B06UD82EPJ6"
}

resource "cloudflare_notification_policy_webhooks" "slack_tunnel" {
  account_id = var.cloudflare_account_id
  name       = "Cloudflare Tunnel Notification"
  url        = "https://hooks.slack.com/services/T016EEV6MU3/B070B67DC3E"
}

resource "cloudflare_notification_policy_webhooks" "slack_status" {
  account_id = var.cloudflare_account_id
  name       = "Cloudflare Status Notification"
  url        = "https://hooks.slack.com/services/T016EEV6MU3/B0708PFRT6E"
}

resource "cloudflare_notification_policy_webhooks" "slack_pages" {
  account_id = var.cloudflare_account_id
  name       = "Cloudflare Pages Notification"
  url        = "https://hooks.slack.com/services/T016EEV6MU3/B070HL74NBH"
}