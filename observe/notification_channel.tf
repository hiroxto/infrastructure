resource "newrelic_notification_channel" "slack_general" {
  name           = "200_newrelic_notification"
  type           = "SLACK"
  destination_id = data.newrelic_notification_destination.slack.id
  product        = "IINT"

  property {
    key           = "channelId"
    value         = "C0748SCKVL3"
    display_value = "200_newrelic_notification"
  }
}
