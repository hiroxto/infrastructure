#
# Golden Signals
#
resource "newrelic_nrql_alert_condition" "high_application_error_percentage" {
  name      = "High Application Error percentage"
  policy_id = newrelic_alert_policy.golden_signals.id
  enabled   = true
  type      = "baseline"

  baseline_direction           = "UPPER_ONLY"
  violation_time_limit_seconds = 2592000

  nrql {
    query = "FROM Metric SELECT count(apm.service.error.count) / count(apm.service.transaction.duration) as 'Error Rate' WHERE appName LIKE '%' FACET entity.guid, appName"
  }

  critical {
    operator              = "above"
    threshold             = 3
    threshold_duration    = 300
    threshold_occurrences = "all"
  }
}

resource "newrelic_nrql_alert_condition" "high_application_response_time" {
  name      = "High Application Response Time"
  policy_id = newrelic_alert_policy.golden_signals.id
  enabled   = true
  type      = "baseline"

  baseline_direction           = "UPPER_ONLY"
  violation_time_limit_seconds = 2592000

  nrql {
    query = "SELECT average(newrelic.goldenmetrics.apm.application.responseTimeMs) FROM Metric FACET entity.guid, appName"
  }

  critical {
    operator              = "above"
    threshold             = 3
    threshold_duration    = 300
    threshold_occurrences = "all"
  }
}

resource "newrelic_nrql_alert_condition" "high_cpu" {
  name      = "High CPU"
  policy_id = newrelic_alert_policy.golden_signals.id
  enabled   = true
  type      = "static"

  violation_time_limit_seconds = 2592000

  nrql {
    query = "SELECT average(`host.cpuPercent`) FROM Metric FACET entity.guid, host.hostname"
  }

  critical {
    operator              = "above"
    threshold             = 85
    threshold_duration    = 300
    threshold_occurrences = "all"
  }
}

resource "newrelic_nrql_alert_condition" "low_application_throughput" {
  name      = "Low Application Throughput"
  policy_id = newrelic_alert_policy.golden_signals.id
  enabled   = true
  type      = "baseline"

  baseline_direction             = "LOWER_ONLY"
  expiration_duration            = 600
  violation_time_limit_seconds   = 2592000
  close_violations_on_expiration = true
  open_violation_on_expiration   = true

  nrql {
    query = "SELECT average(`newrelic.goldenmetrics.apm.application.throughput`) FROM Metric FACET entity.guid, appName"
  }

  critical {
    operator              = "above"
    threshold             = 3
    threshold_duration    = 300
    threshold_occurrences = "all"
  }
}
