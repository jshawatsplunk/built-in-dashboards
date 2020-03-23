# signalfx_dashboard_group.sfx_aws_ec2:
resource "signalfx_dashboard_group" "sfx_aws_ec2" {
    description = "Dashboards about Amazon Elastic Compute Cloud (EC2)."
    name        = "AWS EC2"
    teams       = []

    import_qualifier {
        metric = "CPUUtilization"

        filters {
            negated  = false
            property = "InstanceId"
            values   = []
        }
        filters {
            negated  = false
            property = "namespace"
            values   = [
                "AWS/EC2",
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
