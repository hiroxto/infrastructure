resource "newrelic_alert_policy" "golden_signals" {
  name                = "Golden Signals"
  incident_preference = "PER_CONDITION_AND_TARGET"
}
