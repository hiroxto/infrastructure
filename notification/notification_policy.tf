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
        id = var.target_email
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
# Pages
#
resource "cloudflare_notification_policy" "pages_event_alert_prod" {
  account_id = var.cloudflare_account_id

  enabled     = true
  alert_type  = "pages_event_alert"
  name        = "Pages Prod event alert"
  description = "Cloudflare Pages Production event alert"

  mechanisms = {
    webhooks = [
      {
        id = cloudflare_notification_policy_webhooks.slack_pages_prod.id
      }
    ]
  }

  filters = {
    # 本番環境のデプロイのみ受け取る
    environment = ["ENVIRONMENT_PRODUCTION"]
    event       = ["EVENT_DEPLOYMENT_STARTED", "EVENT_DEPLOYMENT_FAILED", "EVENT_DEPLOYMENT_SUCCESS"]
    project_id  = var.pages_project_ids
  }
}

resource "cloudflare_notification_policy" "pages_event_alert_preview" {
  account_id = var.cloudflare_account_id

  enabled     = true
  alert_type  = "pages_event_alert"
  name        = "Pages Preview event alert"
  description = "Cloudflare Pages Preview event alert"

  mechanisms = {
    webhooks = [
      {
        id = cloudflare_notification_policy_webhooks.slack_pages_preview.id
      }
    ]
  }

  filters = {
    # プレビュー環境のデプロイのみ受け取る
    environment = ["ENVIRONMENT_PREVIEW"]
    event       = ["EVENT_DEPLOYMENT_STARTED", "EVENT_DEPLOYMENT_FAILED", "EVENT_DEPLOYMENT_SUCCESS"]
    project_id  = var.pages_project_ids
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
