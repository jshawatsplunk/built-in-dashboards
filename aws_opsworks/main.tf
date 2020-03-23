# signalfx_dashboard_group.sfx_aws_opsworks:
resource "signalfx_dashboard_group" "sfx_aws_opsworks" {
  description = "Dashboards about AWS OpsWorks."
  name        = "AWS OpsWorks"
  teams       = []

  import_qualifier {
    metric = "cpu_idle"

    filters {
      negated  = false
      property = "StackId"
      values   = []
    }
    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/OpsWorks",
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
