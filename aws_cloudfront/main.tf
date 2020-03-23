# signalfx_dashboard_group.sfx_aws_cloudfront:
resource "signalfx_dashboard_group" "sfx_aws_cloudfront" {
  description = "Dashboards about Amazon CloudFront."
  name        = "AWS CloudFront"
  teams       = []

  import_qualifier {
    metric = "BytesDownloaded"

    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/CloudFront",
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
  import_qualifier {
    metric = "BytesUploaded"

    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/CloudFront",
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
  import_qualifier {
    metric = "Requests"

    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/CloudFront",
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
