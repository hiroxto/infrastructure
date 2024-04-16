# WARNING: プランによっては使えない通知もあるため，追加する前に要確認
# 利用可能な通知は公式ドキュメントを確認
# https://developers.cloudflare.com/notifications/notification-available/

#
# Default
#
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

#
# Cloudflare Status
#
resource "cloudflare_notification_policy" "maintenance_event_notification" {
  account_id = cloudflare_account.main.id

  enabled    = true
  alert_type = "maintenance_event_notification"
  name       = "Maintenance event notification"

  webhooks_integration {
    id   = cloudflare_notification_policy_webhooks.slack.id
    name = cloudflare_notification_policy_webhooks.slack.name
  }
}

resource "cloudflare_notification_policy" "incident_alert" {
  account_id = cloudflare_account.main.id

  enabled    = true
  alert_type = "incident_alert"
  name       = "Incident alert"

  webhooks_integration {
    id   = cloudflare_notification_policy_webhooks.slack.id
    name = cloudflare_notification_policy_webhooks.slack.name
  }
}

#
# SSL/TLS
#
resource "cloudflare_notification_policy" "universal_ssl_event_type" {
  account_id = cloudflare_account.main.id

  enabled    = true
  alert_type = "universal_ssl_event_type"
  name       = "Universal ssl event type"

  webhooks_integration {
    id   = cloudflare_notification_policy_webhooks.slack.id
    name = cloudflare_notification_policy_webhooks.slack.name
  }
}

#
# Web Analytics
#
resource "cloudflare_notification_policy" "web_analytics_metrics_update" {
  account_id = cloudflare_account.main.id

  enabled    = true
  alert_type = "web_analytics_metrics_update"
  name       = "Web analytics metrics update"

  webhooks_integration {
    id   = cloudflare_notification_policy_webhooks.slack.id
    name = cloudflare_notification_policy_webhooks.slack.name
  }
}
