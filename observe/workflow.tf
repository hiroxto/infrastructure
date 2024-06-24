resource "newrelic_workflow" "golden_signals" {
  name                  = "Policy 5299369: Golden Signals"
  muting_rules_handling = "DONT_NOTIFY_FULLY_MUTED_ISSUES"

  issues_filter {
    name = ""
    type = "FILTER"

    predicate {
      attribute = "labels.policyIds"
      operator  = "EXACTLY_MATCHES"
      values = [
        newrelic_alert_policy.golden_signals.id
      ]
    }
  }

  destination {
    channel_id = newrelic_notification_channel.slack_general.id
    notification_triggers = [
      "ACKNOWLEDGED",
      "ACTIVATED",
      "CLOSED",
      "OTHER_UPDATES",
      "PRIORITY_CHANGED",
    ]
  }
}

resource "newrelic_workflow" "dtv_alerts" {
  name                  = "DTV Alerts"
  muting_rules_handling = "DONT_NOTIFY_FULLY_MUTED_ISSUES"

  issues_filter {
    name = ""
    type = "FILTER"

    predicate {
      attribute = "labels.policyIds"
      operator  = "EXACTLY_MATCHES"
      values = [
        newrelic_alert_policy.dtv_alerts.id
      ]
    }
  }

  destination {
    channel_id = newrelic_notification_channel.slack_dtv_alert.id
    notification_triggers = [
      "ACKNOWLEDGED",
      "ACTIVATED",
      "CLOSED",
      "OTHER_UPDATES",
      "PRIORITY_CHANGED",
    ]
  }
}

resource "newrelic_workflow" "system_alerts" {
  name                  = "System Alerts"
  muting_rules_handling = "DONT_NOTIFY_FULLY_MUTED_ISSUES"

  issues_filter {
    name = ""
    type = "FILTER"

    predicate {
      attribute = "labels.policyIds"
      operator  = "EXACTLY_MATCHES"
      values = [
        newrelic_alert_policy.system_alerts.id
      ]
    }
  }

  destination {
    channel_id = newrelic_notification_channel.slack_system_alert.id
    notification_triggers = [
      "ACKNOWLEDGED",
      "ACTIVATED",
      "CLOSED",
      "OTHER_UPDATES",
      "PRIORITY_CHANGED",
    ]
  }
}
