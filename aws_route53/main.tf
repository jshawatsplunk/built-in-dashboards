# signalfx_dashboard_group.sfx_aws_route53:
resource "signalfx_dashboard_group" "sfx_aws_route53" {
  description = "Dashboards about Amazon Route 53."
  name        = "AWS Route53"
  teams       = []

  import_qualifier {
    metric = "HealthCheckStatus"

    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/Route53",
      ]
    }
    filters {
      negated  = false
      property = "stat"
      values = [
        "lower",
      ]
    }
  }
}
