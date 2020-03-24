# signalfx_dashboard_group.sfx_aws_redshift:
resource "signalfx_dashboard_group" "sfx_aws_redshift" {
  name  = "AWS Redshift"
  teams = []

  import_qualifier {
    metric = "CPUUtilization"

    filters {
      negated  = false
      property = "ClusterIdentifier"
      values   = []
    }
    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/Redshift",
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
