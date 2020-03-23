# signalfx_dashboard_group.sfx_aws_kinesis_analytics:
resource "signalfx_dashboard_group" "sfx_aws_kinesis_analytics" {
  name  = "AWS Kinesis Analytics"
  teams = []

  import_qualifier {
    metric = "Bytes"

    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/KinesisAnalytics",
      ]
    }
  }
}
