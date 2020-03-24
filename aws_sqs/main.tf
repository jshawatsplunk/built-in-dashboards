# signalfx_dashboard_group.sfx_aws_sqs:
resource "signalfx_dashboard_group" "sfx_aws_sqs" {
  description = "Dashboards about Amazon Simple Queue Service (SQS)."
  name        = "AWS SQS"
  teams       = []

  import_qualifier {
    metric = "NumberOfMessagesSent"

    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/SQS",
      ]
    }
    filters {
      negated  = false
      property = "stat"
      values = [
        "sum",
      ]
    }
  }
}
