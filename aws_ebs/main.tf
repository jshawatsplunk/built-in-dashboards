# signalfx_dashboard_group.sfx_aws_ebs:
resource "signalfx_dashboard_group" "sfx_aws_ebs" {
    description = "Dashboards about Amazon Elastic Block Store (EBS)."
    name        = "AWS EBS"
    teams       = []

    import_qualifier {
        metric = "VolumeIdleTime"

        filters {
            negated  = false
            property = "VolumeId"
            values   = []
        }
        filters {
            negated  = false
            property = "namespace"
            values   = [
                "AWS/EBS",
            ]
        }
        filters {
            negated  = false
            property = "stat"
            values   = [
                "mean",
            ]
        }
    }
}
