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

resource "newrelic_notification_channel" "slack_dtv_alert" {
  name           = "200_newrelic_dtv_alert_notification"
  type           = "SLACK"
  destination_id = data.newrelic_notification_destination.slack.id
  product        = "IINT"

  property {
    key   = "customDetailsSlack"
    value = "<!channel>"
  }
  property {
    key           = "channelId"
    value         = "C077N1R6T9A"
    display_value = "200_newrelic_dtv_alert_notification"
  }
}
