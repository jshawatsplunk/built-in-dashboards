# signalfx_dashboard_group.sfx_aws_alb:
resource "signalfx_dashboard_group" "sfx_aws_alb" {
  description = "Dashboards about Amazon Application Load Balancing (ALB)."
  name        = "AWS ALB"
  teams       = []

  import_qualifier {
    metric = "HealthyHostCount"

    filters {
      negated  = false
      property = "LoadBalancer"
      values   = []
    }
    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/ApplicationELB",
      ]
    }
    filters {
      negated  = false
      property = "stat"
      values = [
        "count",
      ]
    }
  }
}
