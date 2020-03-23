# signalfx_dashboard_group.sfx_aws_elasticache:
resource "signalfx_dashboard_group" "sfx_aws_elasticache" {
  description = "Dashboards about Amazon ElastiCache."
  name        = "AWS ElastiCache"
  teams       = []

  import_qualifier {
    metric = "CPUUtilization"

    filters {
      negated  = false
      property = "CacheClusterId"
      values   = []
    }
    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/ElastiCache",
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
