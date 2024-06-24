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

#
# DTV Alerts
#
resource "newrelic_nrql_alert_condition" "epgstation_health_check" {
  name               = "EPGStation health check"
  policy_id          = newrelic_alert_policy.dtv_alerts.id
  enabled            = false
  type               = "static"
  aggregation_window = 300
  aggregation_method = "event_flow"
  aggregation_delay  = 0

  nrql {
    query = "SELECT latest(if(result = 'FAILED', 1, 0)) FROM SyntheticCheck WHERE entityGuid = '${newrelic_synthetics_monitor.epgstation.id}' FACET entityGuid, monitorName"
  }

  critical {
    operator              = "above_or_equals"
    threshold             = 1.0
    threshold_duration    = 300
    threshold_occurrences = "all"
  }
}

#
# System Alerts
#
resource "newrelic_nrql_alert_condition" "error_logs" {
  name               = "Error logs"
  description        = "WARN/ERROR/FATALのログが検出された"
  policy_id          = newrelic_alert_policy.system_alerts.id
  enabled            = true
  type               = "static"
  aggregation_window = 60
  aggregation_method = "event_flow"
  aggregation_delay  = 0

  nrql {
    query = "SELECT count(*) FROM Log WHERE message RLIKE '.*\\\\[(WARN|ERROR|FATAL)\\\\].*'"
  }

  critical {
    operator              = "above"
    threshold             = 1
    threshold_duration    = 60
    threshold_occurrences = "all"
  }
}
