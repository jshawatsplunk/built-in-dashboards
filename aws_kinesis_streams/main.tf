# signalfx_dashboard_group.sfx_aws_kinesis_streams:
resource "signalfx_dashboard_group" "sfx_aws_kinesis_streams" {
  name  = "AWS Kinesis Streams"
  teams = []

  import_qualifier {
    metric = "GetRecords.Latency"

    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/Kinesis",
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
