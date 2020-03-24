# signalfx_dashboard_group.sfx_aws_rds:
resource "signalfx_dashboard_group" "sfx_aws_rds" {
  description = "Dashboards about Amazon Relational Database Service (RDS)."
  name        = "AWS RDS"
  teams       = []

  import_qualifier {
    metric = "CPUUtilization"

    filters {
      negated  = false
      property = "DBInstanceIdentifier"
      values   = []
    }
    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/RDS",
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
