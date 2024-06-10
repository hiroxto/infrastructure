# NOTE: Slack の newrelic_notification_destination をインポートしても変更できないので data resource を使う
data "newrelic_notification_destination" "slack" {
  id = "c9d379d7-6e75-4351-8c75-7f3d8154e121"
}
