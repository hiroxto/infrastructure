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

  email_integration {
    id = var.target_email
  }
}

#
# Cloudflare Status
#
resource "cloudflare_notification_policy" "maintenance_event_notification" {
  account_id = var.cloudflare_account_id

  enabled    = false
  alert_type = "maintenance_event_notification"
  name       = "Maintenance event notification"

  webhooks_integration {
    id   = cloudflare_notification_policy_webhooks.slack_status.id
    name = cloudflare_notification_policy_webhooks.slack_status.name
  }
}

resource "cloudflare_notification_policy" "incident_alert" {
  account_id = var.cloudflare_account_id

  enabled    = false
  alert_type = "incident_alert"
  name       = "Incident alert"

  webhooks_integration {
    id   = cloudflare_notification_policy_webhooks.slack_status.id
    name = cloudflare_notification_policy_webhooks.slack_status.name
  }
}

#
# Pages
#
resource "cloudflare_notification_policy" "pages_event_alert_prod" {
  account_id = var.cloudflare_account_id

  enabled    = true
  alert_type = "pages_event_alert"
  name       = "Pages Prod event alert"

  webhooks_integration {
    id   = cloudflare_notification_policy_webhooks.slack_pages_prod.id
    name = cloudflare_notification_policy_webhooks.slack_pages_prod.name
  }

  filters {
    # 本番環境のデプロイのみ受け取る
    environment = ["ENVIRONMENT_PRODUCTION"]
    event       = ["EVENT_DEPLOYMENT_STARTED", "EVENT_DEPLOYMENT_FAILED", "EVENT_DEPLOYMENT_SUCCESS"]
    # NOTE: cloudflare_pages_project のリソースに ID 属性はあるが name 属性と同じ値が取得できるだけなのでハードコーディング
    project_id = [
      "33a852bd-16a6-4d03-9251-2e90223ef8dc", # swarm-checkin-regulation-checker
      "55e413ae-b964-4671-bb0f-6a88fe146619", # hiroxto-utils-hiroxto-net
      "c4aafd7f-f4ce-442d-a597-ddea67b8fa46", # hiroxto-net
      "800314de-8cc8-4092-98c4-96f6928e2547", # hiroxto-train-photo-blog
    ]
  }
}

resource "cloudflare_notification_policy" "pages_event_alert_preview" {
  account_id = var.cloudflare_account_id

  enabled    = true
  alert_type = "pages_event_alert"
  name       = "Pages Preview event alert"

  webhooks_integration {
    id   = cloudflare_notification_policy_webhooks.slack_pages_preview.id
    name = cloudflare_notification_policy_webhooks.slack_pages_preview.name
  }

  filters {
    # プレビュー環境のデプロイのみ受け取る
    environment = ["ENVIRONMENT_PREVIEW"]
    event       = ["EVENT_DEPLOYMENT_STARTED", "EVENT_DEPLOYMENT_FAILED", "EVENT_DEPLOYMENT_SUCCESS"]
    # NOTE: cloudflare_pages_project のリソースに ID 属性はあるが name 属性と同じ値が取得できるだけなのでハードコーディング
    project_id = [
      "33a852bd-16a6-4d03-9251-2e90223ef8dc", # swarm-checkin-regulation-checker
      "55e413ae-b964-4671-bb0f-6a88fe146619", # hiroxto-utils-hiroxto-net
      "c4aafd7f-f4ce-442d-a597-ddea67b8fa46", # hiroxto-net
      "800314de-8cc8-4092-98c4-96f6928e2547", # hiroxto-train-photo-blog
    ]
  }
}

#
# SSL/TLS
#
resource "cloudflare_notification_policy" "universal_ssl_event_type" {
  account_id = var.cloudflare_account_id

  enabled    = true
  alert_type = "universal_ssl_event_type"
  name       = "Universal ssl event type"

  webhooks_integration {
    id   = cloudflare_notification_policy_webhooks.slack.id
    name = cloudflare_notification_policy_webhooks.slack.name
  }
}

#
# Tunnel
#
resource "cloudflare_notification_policy" "tunnel_health_event" {
  account_id = var.cloudflare_account_id

  enabled    = true
  alert_type = "tunnel_health_event"
  name       = "Tunnel health event"

  webhooks_integration {
    id   = cloudflare_notification_policy_webhooks.slack_tunnel.id
    name = cloudflare_notification_policy_webhooks.slack_tunnel.name
  }
}

resource "cloudflare_notification_policy" "tunnel_update_event" {
  account_id = var.cloudflare_account_id

  enabled    = true
  alert_type = "tunnel_update_event"
  name       = "Tunnel update event"

  webhooks_integration {
    id   = cloudflare_notification_policy_webhooks.slack_tunnel.id
    name = cloudflare_notification_policy_webhooks.slack_tunnel.name
  }
}

#
# Web Analytics
#
resource "cloudflare_notification_policy" "web_analytics_metrics_update" {
  account_id = var.cloudflare_account_id

  enabled    = true
  alert_type = "web_analytics_metrics_update"
  name       = "Web analytics metrics update"

  webhooks_integration {
    id   = cloudflare_notification_policy_webhooks.slack.id
    name = cloudflare_notification_policy_webhooks.slack.name
  }
}
