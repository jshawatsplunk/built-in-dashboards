# signalfx_dashboard_group.sfx_aws_rds_enchanced_aurora:
resource "signalfx_dashboard_group" "sfx_aws_rds_enchanced_aurora" {
  description = "Basic dashboard group for enhanced RDS metrics from Aurora instances"
  name        = "AWS Enhanced RDS Monitoring - Aurora"
  teams       = []

  import_qualifier {
    metric = "OSprocesses.cpuUsedPc"

    filters {
      negated  = false
      property = "EngineName"
      values = [
        "Aurora",
      ]
    }
  }
  import_qualifier {
    metric = "RDSprocesses.cpuUsedPc"

    filters {
      negated  = false
      property = "EngineName"
      values = [
        "Aurora",
      ]
    }
  }
  import_qualifier {
    metric = "cpuUtilization.total"

    filters {
      negated  = false
      property = "EngineName"
      values = [
        "Aurora",
      ]
    }
  }
  import_qualifier {
    metric = "diskIO.diskQueueDepth"

    filters {
      negated  = false
      property = "EngineName"
      values = [
        "Aurora",
      ]
    }
  }
  import_qualifier {
    metric = "fileSys.maxFiles"

    filters {
      negated  = false
      property = "EngineName"
      values = [
        "Aurora",
      ]
    }
  }
  import_qualifier {
    metric = "loadAverageMinute.fifteen"

    filters {
      negated  = false
      property = "EngineName"
      values = [
        "Aurora",
      ]
    }
  }
  import_qualifier {
    metric = "memory.active"

    filters {
      negated  = false
      property = "EngineName"
      values = [
        "Aurora",
      ]
    }
  }
}
