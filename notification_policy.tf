resource "cloudflare_notification_policy" "real_origin_monitoring_to_email" {
  account_id = cloudflare_account.main.id

  enabled     = true
  alert_type  = "real_origin_monitoring"
  name        = "Passive Origin Monitoring"
  description = "Recieve an email when your origin becomes unreachable"

  email_integration {
    id = "hiroto.ktzw@gmail.com"
  }
}

resource "cloudflare_notification_policy" "web_analytics_metrics_update" {
  account_id = cloudflare_account.main.id

  enabled    = true
  alert_type = "web_analytics_metrics_update"
  name       = "Update Web Analytics Metrix"

  webhooks_integration {
    id   = cloudflare_notification_policy_webhooks.slack.id
    name = cloudflare_notification_policy_webhooks.slack.name
  }
}
