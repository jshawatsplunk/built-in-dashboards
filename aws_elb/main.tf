# signalfx_dashboard_group.sfx_aws_elb:
resource "signalfx_dashboard_group" "sfx_aws_elb" {
  description = "Dashboards about Amazon Elastic Load Balancing (ELB)."
  name        = "AWS ELB"
  teams       = []

  import_qualifier {
    metric = "HealthyHostCount"

    filters {
      negated  = false
      property = "LoadBalancerName"
      values   = []
    }
    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/ELB",
      ]
    }
    filters {
      negated  = false
      property = "stat"
      values = [
        "mean",
      ]
    }
  }
}
