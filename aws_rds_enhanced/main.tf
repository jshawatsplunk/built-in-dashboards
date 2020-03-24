# signalfx_dashboard_group.sfx_aws_rds_enchanced:
resource "signalfx_dashboard_group" "sfx_aws_rds_enchanced" {
  description = "Basic dashboard group for enhanced RDS metrics"
  name        = "AWS Enhanced RDS Monitoring"
  teams       = []

  import_qualifier {
    metric = "diskIO.avgQueueLen"

    filters {
      negated  = false
      property = "Namespace"
      values = [
        "AWS/RDS",
      ]
    }
  }
  import_qualifier {
    metric = "diskIO.avgQueueLen"

    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/RDS",
      ]
    }
  }
}
