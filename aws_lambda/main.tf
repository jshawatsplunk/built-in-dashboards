# signalfx_dashboard_group.sfx_aws_lambda:
resource "signalfx_dashboard_group" "sfx_aws_lambda" {
  name  = "AWS Lambda"
  teams = []

  import_qualifier {
    metric = "function.invocations"

    filters {
      negated  = false
      property = "metric_source"
      values = [
        "lambda_wrapper",
      ]
    }
  }
  import_qualifier {
    metric = "ConcurrentExecutions"

    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/Lambda",
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
