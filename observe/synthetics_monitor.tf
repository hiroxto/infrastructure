resource "newrelic_synthetics_monitor" "epgstation" {
  status           = "ENABLED"
  name             = "EPGStation"
  period           = "EVERY_5_MINUTES"
  uri              = var.epgstation_uri
  type             = "SIMPLE"
  locations_public = ["AWS_AP_NORTHEAST_1"]

  verify_ssl                = true
  treat_redirect_as_failure = true
  bypass_head_request       = true

  custom_header {
    name  = "Cache-Control"
    value = "no-cache"
  }
  custom_header {
    name  = "CF-Access-Client-Id"
    value = var.cfa_client_id
  }
  custom_header {
    name  = "CF-Access-Client-Secret"
    value = var.cfa_client_secret
  }
}
