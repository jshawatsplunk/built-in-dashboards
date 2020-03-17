# signalfx_dashboard_group.sfx_aws_asg:
resource "signalfx_dashboard_group" "sfx_aws_asg" {
  description = "Dashboards about Amazon Auto Scaling."
  name        = "AWS AutoScaling"
  teams       = []

  import_qualifier {
    metric = "GroupTotalInstances"

    filters {
      negated  = false
      property = "AutoScalingGroupName"
      values   = []
    }
    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/AutoScaling",
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
