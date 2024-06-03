resource "tfe_notification_configuration" "slack" {
  name             = "Slack Notification"
  enabled          = true
  destination_type = "slack"
  triggers = [
    "run:created",
    "run:planning",
    "run:needs_attention",
    "run:applying",
    "run:completed",
    "run:errored",
  ]
  url          = var.slack_webhook_url
  workspace_id = var.tfe_workspace_id
}
