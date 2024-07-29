data "newrelic_notification_destination" "slack" {
  id = "c9d379d7-6e75-4351-8c75-7f3d8154e121"
}

data "newrelic_entity" "eq12_01" {
  name   = "eq12-01"
  domain = "INFRA"
}
