# signalfx_dashboard_group.sfx_aws_ecs:
resource "signalfx_dashboard_group" "sfx_aws_ecs" {
  description = "Dashboards about Amazon EC2 Container Service (ECS)."
  name        = "AWS ECS"
  teams       = []

  import_qualifier {
    metric = "CPUUtilization"

    filters {
      negated  = false
      property = "ClusterName"
      values   = []
    }
    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/ECS",
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
  import_qualifier {
    metric = "cpu.usage.system"

    filters {
      negated  = false
      property = "ClusterName"
      values   = []
    }
  }
}
