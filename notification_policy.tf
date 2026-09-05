# WARNING: プランによっては使えない通知もあるため，追加する前に要確認
# 利用可能な通知は公式ドキュメントを確認
# https://developers.cloudflare.com/notifications/notification-available/

#
# Default
#
resource "cloudflare_notification_policy" "real_origin_monitoring_to_email" {
  account_id = var.cloudflare_account_id

  enabled     = true
  alert_type  = "real_origin_monitoring"
  name        = "Passive Origin Monitoring"
  description = "Recieve an email when your origin becomes unreachable"
  filters     = {}

  mechanisms = {
    email = [
      {
        id = var.admin_gmail_address
      }
    ]
  }
}

#
# Cloudflare Status
#
resource "cloudflare_notification_policy" "maintenance_event_notification" {
  account_id = var.cloudflare_account_id

  enabled     = false
  alert_type  = "maintenance_event_notification"
  name        = "Maintenance event notification"
  description = "Maintenance event"
  filters     = {}

  mechanisms = {
    webhooks = [
      {
        id = cloudflare_notification_policy_webhooks.slack_status.id
      }
    ]
  }
}

resource "cloudflare_notification_policy" "incident_alert" {
  account_id = var.cloudflare_account_id

  enabled     = false
  alert_type  = "incident_alert"
  name        = "Incident alert"
  description = "Incident alert"
  filters     = {}

  mechanisms = {
    webhooks = [
      {
        id = cloudflare_notification_policy_webhooks.slack_status.id
      }
    ]
  }
}

#
# SSL/TLS
#
resource "cloudflare_notification_policy" "universal_ssl_event_type" {
  account_id = var.cloudflare_account_id

  enabled     = true
  alert_type  = "universal_ssl_event_type"
  name        = "Universal ssl event type"
  description = "Universal ssl event"
  filters     = {}

  mechanisms = {
    webhooks = [
      {
        id = cloudflare_notification_policy_webhooks.slack.id
      }
    ]
  }
}

#
# Tunnel
#
resource "cloudflare_notification_policy" "tunnel_health_event" {
  account_id = var.cloudflare_account_id

  enabled     = true
  alert_type  = "tunnel_health_event"
  name        = "Tunnel health event"
  description = "Cloudflare Tunnel health event"
  filters     = {}

  mechanisms = {
    webhooks = [
      {
        id = cloudflare_notification_policy_webhooks.slack_tunnel.id
      }
    ]
  }
}

resource "cloudflare_notification_policy" "tunnel_update_event" {
  account_id = var.cloudflare_account_id

  enabled     = true
  alert_type  = "tunnel_update_event"
  name        = "Tunnel update event"
  description = "Cloudflare Tunnel update event"
  filters     = {}

  mechanisms = {
    webhooks = [
      {
        id = cloudflare_notification_policy_webhooks.slack_tunnel.id
      }
    ]
  }
}

#
# Web Analytics
#
resource "cloudflare_notification_policy" "web_analytics_metrics_update" {
  account_id = var.cloudflare_account_id

  enabled     = true
  alert_type  = "web_analytics_metrics_update"
  name        = "Web analytics metrics update"
  description = "Web analytics metrics update"
  filters     = {}

  mechanisms = {
    webhooks = [
      {
        id = cloudflare_notification_policy_webhooks.slack.id
      }
    ]
  }
}

#
# DDoS Protection
#
resource "cloudflare_notification_policy" "dos_attack_l7" {
  account_id = var.cloudflare_account_id

  enabled     = true
  alert_type  = "dos_attack_l7"
  name        = "HTTP DDoS Attack Alert"
  description = "HTTP DDoS Attack Alert"
  filters     = {}

  mechanisms = {
    webhooks = [
      {
        id = cloudflare_notification_policy_webhooks.slack.id
      }
    ]
  }
}

#
# Security Center
#
resource "cloudflare_notification_policy" "security_insights_alert" {
  account_id = var.cloudflare_account_id

  enabled     = true
  alert_type  = "security_insights_alert"
  name        = "Security Insights"
  description = "Security Insights"
  filters = {
    insight_class = [
      "always_https_not_enabled",
      "no_challenge_ai_bots",
      "no_block_ai_bots",
      "response_size_anomaly_on_endpoint",
      "increased_error_rate_on_endpoint",
      "increased_latency_on_endpoint",
      "sensitive_data_on_endpoint",
      "update_bots_model",
      "manage_bot_fight_mode",
      "casb_unhealthy_integrations",
    ]
  }

  mechanisms = {
    webhooks = [
      {
        id = cloudflare_notification_policy_webhooks.slack.id
      }
    ]
  }
}

resource "cloudflare_notification_policy" "abuse_report_alert" {
  account_id = var.cloudflare_account_id

  enabled     = true
  alert_type  = "abuse_report_alert"
  name        = "Abuse report"
  description = "Abuse report"
  filters     = {}

  mechanisms = {
    webhooks = [
      {
        id = cloudflare_notification_policy_webhooks.slack.id
      }
    ]
  }
}
