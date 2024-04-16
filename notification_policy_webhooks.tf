resource "cloudflare_notification_policy_webhooks" "slack" {
  account_id = cloudflare_account.main.id
  name       = "Slack(hiroxto) Cloudflare Notification"
  url        = "https://hooks.slack.com/services/T016EEV6MU3/B06UD82EPJ6"
}
