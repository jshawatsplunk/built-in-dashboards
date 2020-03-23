# signalfx_dashboard_group.sfx_aws_dynamodb:
resource "signalfx_dashboard_group" "sfx_aws_dynamodb" {
  name  = "AWS DynamoDB"
  teams = []

  import_qualifier {
    metric = "SuccessfulRequestLatency"

    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/DynamoDB",
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
