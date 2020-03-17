# signalfx_dashboard_group.sfx_aws_api_gateway:
resource "signalfx_dashboard_group" "sfx_aws_api_gateway" {
  description = "Dashboards about Amazon API Gateway"
  name        = "AWS API Gateway"
  teams       = []

  import_qualifier {
    metric = "4XXError"

    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/ApiGateway",
      ]
    }
  }
  import_qualifier {
    metric = "5XXError"

    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/ApiGateway",
      ]
    }
  }
  import_qualifier {
    metric = "CacheHitCount"

    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/ApiGateway",
      ]
    }
  }
  import_qualifier {
    metric = "CacheMissCount"

    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/ApiGateway",
      ]
    }
  }
  import_qualifier {
    metric = "Count"

    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/ApiGateway",
      ]
    }
  }
  import_qualifier {
    metric = "IntegrationLatency"

    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/ApiGateway",
      ]
    }
  }
  import_qualifier {
    metric = "Latency"

    filters {
      negated  = false
      property = "namespace"
      values = [
        "AWS/ApiGateway",
      ]
    }
  }
}
