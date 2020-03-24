# signalfx_dashboard_group.sfx_aws_sns:
resource "signalfx_dashboard_group" "sfx_aws_sns" {
  description = "Dashboards about Amazon Simple Notification Service (SNS)."
  name        = "AWS SNS"
  teams       = []

  import_qualifier {
    metric = "NumberOfMessagesPublished"

    filters {
      negated  = false
      property = "TopicName"
      values   = []
    }
    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/SNS",
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
