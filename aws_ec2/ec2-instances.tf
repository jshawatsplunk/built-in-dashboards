# signalfx_single_value_chart.sfx_aws_ec2_dash_1_0:
resource "signalfx_single_value_chart" "sfx_aws_ec2_dash_1_0" {
    color_by                = "Dimension"
    description             = "that reported in last hour"
    is_timestamp_hidden     = false
    max_precision           = 5
    name                    = "Active Hosts"
    program_text            = <<-EOF
        A = data('CPUUtilization', filter=filter('namespace', 'AWS/EC2') and filter('stat', 'upper') and filter('InstanceId', '*'), extrapolation='last_value', maxExtrapolations=5).max(over='1h').count().publish(label='A')
    EOF
    secondary_visualization = "None"
    show_spark_line         = false
    unit_prefix             = "Metric"

    viz_options {
        display_name = "# hosts"
        label        = "A"
    }
}
# signalfx_list_chart.sfx_aws_ec2_dash_1_1:
resource "signalfx_list_chart" "sfx_aws_ec2_dash_1_1" {
    color_by                = "Dimension"
    description             = "that reported in last hour"
    max_precision           = 0
    name                    = "Active Hosts Per Instance Type"
    program_text            = <<-EOF
        A = data('CPUUtilization', filter=filter('stat', 'mean') and filter('namespace', 'AWS/EC2') and filter('InstanceId', '*'), extrapolation='last_value', maxExtrapolations=5).max(over='1h').count(by=['aws_instance_type']).publish(label='A')
    EOF
    secondary_visualization = "Sparkline"
    sort_by                 = "-value"
    unit_prefix             = "Metric"
}
# signalfx_list_chart.sfx_aws_ec2_dash_1_2:
resource "signalfx_list_chart" "sfx_aws_ec2_dash_1_2" {
    color_by                = "Dimension"
    description             = "that reported in last hour"
    max_precision           = 0
    name                    = "Active Hosts by AZ"
    program_text            = <<-EOF
        A = data('CPUUtilization', filter=filter('stat', 'mean') and filter('namespace', 'AWS/EC2') and filter('InstanceId', '*'), extrapolation='last_value', maxExtrapolations=5).max(over='1h').count(by=['aws_availability_zone']).publish(label='A')
    EOF
    secondary_visualization = "Sparkline"
    sort_by                 = "-value"
    unit_prefix             = "Metric"
}
# signalfx_time_chart.sfx_aws_ec2_dash_1_3:
resource "signalfx_time_chart" "sfx_aws_ec2_dash_1_3" {
    axes_include_zero = false
    axes_precision    = 0
    color_by          = "Dimension"
    description       = "percentile distribution"
    disable_sampling  = false
    name              = "CPU %"
    plot_type         = "AreaChart"
    program_text      = <<-EOF
        A = data('CPUUtilization', filter=filter('stat', 'mean') and filter('namespace', 'AWS/EC2') and filter('InstanceId', '*'), extrapolation='last_value', maxExtrapolations=5).publish(label='A', enable=False)
        B = (A).min().publish(label='B')
        C = (A).percentile(pct=10).publish(label='C')
        D = (A).percentile(pct=50).publish(label='D')
        E = (A).percentile(pct=90).publish(label='E')
        F = (A).max().publish(label='F')
    EOF
    show_data_markers = false
    show_event_lines  = false
    stacked           = false
    time_range        = 7200
    timezone          = "UTC"
    unit_prefix       = "Metric"

    axis_left {
        label          = "cpu %"
        max_value      = 110
    }

    viz_options {
        axis         = "left"
        display_name = "CPUUtilization"
        label        = "A"
    }
    viz_options {
        axis         = "left"
        color        = "aquamarine"
        display_name = "p10"
        label        = "C"
    }
    viz_options {
        axis         = "left"
        color        = "azure"
        display_name = "median"
        label        = "D"
    }
    viz_options {
        axis         = "left"
        color        = "green"
        display_name = "min"
        label        = "B"
    }
    viz_options {
        axis         = "left"
        color        = "magenta"
        display_name = "max"
        label        = "F"
    }
    viz_options {
        axis         = "left"
        color        = "pink"
        display_name = "p90"
        label        = "E"
    }
}
# signalfx_list_chart.sfx_aws_ec2_dash_1_4:
resource "signalfx_list_chart" "sfx_aws_ec2_dash_1_4" {
    color_by                = "Dimension"
    max_precision           = 3
    name                    = "Top Instances by CPU %"
    program_text            = <<-EOF
        A = data('CPUUtilization', filter=filter('stat', 'mean') and filter('namespace', 'AWS/EC2') and filter('InstanceId', '*'), extrapolation='last_value', maxExtrapolations=5).mean(by=['InstanceId']).top(count=5).publish(label='A')
    EOF
    secondary_visualization = "Sparkline"
    sort_by                 = "-value"
    unit_prefix             = "Metric"
}
# signalfx_list_chart.sfx_aws_ec2_dash_1_5:
resource "signalfx_list_chart" "sfx_aws_ec2_dash_1_5" {
    color_by                = "Dimension"
    max_precision           = 3
    name                    = "Top Images by Mean CPU %"
    program_text            = <<-EOF
        A = data('CPUUtilization', filter=filter('stat', 'mean') and filter('namespace', 'AWS/EC2') and filter('InstanceId', '*'), extrapolation='last_value', maxExtrapolations=5).mean(by=['aws_image_id']).top(count=5).publish(label='A')
    EOF
    secondary_visualization = "Sparkline"
    sort_by                 = "-value"
    unit_prefix             = "Metric"
}
# signalfx_time_chart.sfx_aws_ec2_dash_1_6:
resource "signalfx_time_chart" "sfx_aws_ec2_dash_1_6" {
    axes_include_zero = false
    axes_precision    = 0
    color_by          = "Dimension"
    disable_sampling  = false
    name              = "Disk Ops/Min"
    plot_type         = "ColumnChart"
    program_text      = <<-EOF
        A = data('DiskWriteOps', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', '*') and filter('stat', 'sum'), rollup='rate', extrapolation='last_value', maxExtrapolations=5).sum().scale(60).publish(label='A')
        B = data('DiskReadOps', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', '*') and filter('stat', 'sum'), rollup='rate', extrapolation='last_value', maxExtrapolations=5).sum().scale(60).publish(label='B')
    EOF
    show_data_markers = false
    show_event_lines  = false
    stacked           = false
    time_range        = 7200
    timezone          = "UTC"
    unit_prefix       = "Metric"

    axis_left {
        label          = "writes - BLUE"
        min_value      = 0
    }

    axis_right {
        label          = "reads - RED"
        min_value      = 0
    }

    viz_options {
        axis         = "left"
        color        = "blue"
        display_name = "write ops/min"
        label        = "A"
    }
    viz_options {
        axis         = "right"
        color        = "brown"
        display_name = "read ops/min"
        label        = "B"
    }
}
# signalfx_time_chart.sfx_aws_ec2_dash_1_7:
resource "signalfx_time_chart" "sfx_aws_ec2_dash_1_7" {
    axes_include_zero = false
    axes_precision    = 0
    color_by          = "Dimension"
    disable_sampling  = false
    name              = "Disk I/O Bytes/Min"
    plot_type         = "ColumnChart"
    program_text      = <<-EOF
        A = data('DiskWriteBytes', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', '*') and filter('stat', 'sum'), rollup='rate', extrapolation='last_value', maxExtrapolations=5).sum().scale(60).publish(label='A')
        B = data('DiskReadBytes', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', '*') and filter('stat', 'sum'), rollup='rate', extrapolation='last_value', maxExtrapolations=5).sum().scale(60).publish(label='B')
    EOF
    show_data_markers = false
    show_event_lines  = false
    stacked           = false
    time_range        = 7200
    timezone          = "UTC"
    unit_prefix       = "Binary"

    axis_left {
        label          = "bytes written - BLUE"
        min_value      = 0
    }

    axis_right {
        label          = "bytes read - RED"
        min_value      = 0
    }

    viz_options {
        axis         = "left"
        color        = "blue"
        display_name = "bytes written/min"
        label        = "A"
    }
    viz_options {
        axis         = "right"
        color        = "brown"
        display_name = "bytes read/min"
        label        = "B"
    }
}
# signalfx_list_chart.sfx_aws_ec2_dash_1_8:
resource "signalfx_list_chart" "sfx_aws_ec2_dash_1_8" {
    color_by                = "Dimension"
    max_precision           = 0
    name                    = "Disk Metrics 24h Growth %"
    program_text            = <<-EOF
        A = data('Disk*', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', '*') and filter('stat', 'sum'), rollup='rate', extrapolation='last_value', maxExtrapolations=5).sum(by=['sf_metric']).scale(60).mean(over='1h').publish(label='A', enable=False)
        B = (A).timeshift('1d').publish(label='B', enable=False)
        C = (A/B - 1).scale(100).publish(label='C')
    EOF
    secondary_visualization = "Sparkline"
    sort_by                 = "+sf_originatingMetric"
    unit_prefix             = "Metric"

    viz_options {
        display_name = "A - Timeshift 1d"
        label        = "B"
    }
}
# signalfx_time_chart.sfx_aws_ec2_dash_1_9:
resource "signalfx_time_chart" "sfx_aws_ec2_dash_1_9" {
    axes_include_zero = false
    axes_precision    = 0
    color_by          = "Dimension"
    description       = "percentile distribution"
    disable_sampling  = false
    name              = "Network Bytes In"
    plot_type         = "AreaChart"
    program_text      = <<-EOF
        A = data('NetworkIn', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', '*') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').scale(60).publish(label='A', enable=False)
        B = (A).min().publish(label='B')
        C = (A).percentile(pct=10).publish(label='C')
        D = (A).percentile(pct=50).publish(label='D')
        E = (A).percentile(pct=90).publish(label='E')
        F = (A).max().publish(label='F')
    EOF
    show_data_markers = false
    show_event_lines  = false
    stacked           = false
    time_range        = 7200
    timezone          = "UTC"
    unit_prefix       = "Binary"

    axis_left {
        label          = "bytes/interval"
        min_value      = 0
    }

    viz_options {
        axis         = "left"
        display_name = "NetworkIn - Scale:60"
        label        = "A"
    }
    viz_options {
        axis         = "left"
        color        = "aquamarine"
        display_name = "p10"
        label        = "C"
    }
    viz_options {
        axis         = "left"
        color        = "azure"
        display_name = "median"
        label        = "D"
    }
    viz_options {
        axis         = "left"
        color        = "green"
        display_name = "min"
        label        = "B"
    }
    viz_options {
        axis         = "left"
        color        = "magenta"
        display_name = "max"
        label        = "F"
    }
    viz_options {
        axis         = "left"
        color        = "pink"
        display_name = "p90"
        label        = "E"
    }
}
# signalfx_list_chart.sfx_aws_ec2_dash_1_10:
resource "signalfx_list_chart" "sfx_aws_ec2_dash_1_10" {
    color_by                = "Dimension"
    max_precision           = 4
    name                    = "Top Network Bytes In/Min"
    program_text            = "A = data('NetworkIn', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', '*') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').scale(60).mean(by=['InstanceId']).top(count=5).publish(label='A')"
    secondary_visualization = "Sparkline"
    sort_by                 = "-value"
    unit_prefix             = "Binary"
}
# signalfx_time_chart.sfx_aws_ec2_dash_1_11:
resource "signalfx_time_chart" "sfx_aws_ec2_dash_1_11" {
    axes_include_zero = false
    axes_precision    = 0
    color_by          = "Dimension"
    disable_sampling  = false
    name              = "Network Bytes In vs. 24h Change %"
    plot_type         = "ColumnChart"
    program_text      = <<-EOF
        A = data('NetworkIn', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', '*') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').sum().scale(60).publish(label='A')
        B = (A).mean(over='1h').publish(label='B', enable=False)
        C = (B).timeshift('1d').publish(label='C', enable=False)
        D = (B/C - 1).scale(100).publish(label='D')
    EOF
    show_data_markers = false
    show_event_lines  = false
    stacked           = false
    time_range        = 7200
    timezone          = "UTC"
    unit_prefix       = "Binary"

    axis_left {
        label          = "bytes/min - BLUE"
    }

    axis_right {
        label          = "% change - RED"
    }

    viz_options {
        axis         = "left"
        display_name = "A - Mean(1h)"
        label        = "B"
    }
    viz_options {
        axis         = "left"
        display_name = "NetworkIn"
        label        = "A"
    }
    viz_options {
        axis      = "right"
        color     = "brown"
        label     = "C"
        plot_type = "LineChart"
    }
    viz_options {
        axis         = "right"
        color        = "brown"
        display_name = "24h growth %"
        label        = "D"
        plot_type    = "LineChart"
    }
}
# signalfx_time_chart.sfx_aws_ec2_dash_1_12:
resource "signalfx_time_chart" "sfx_aws_ec2_dash_1_12" {
    axes_include_zero = false
    axes_precision    = 0
    color_by          = "Dimension"
    description       = "percentile distribution"
    disable_sampling  = false
    name              = "Network Bytes Out"
    plot_type         = "AreaChart"
    program_text      = <<-EOF
        A = data('NetworkOut', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', '*') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').scale(60).publish(label='A', enable=False)
        B = (A).min().publish(label='B')
        C = (A).percentile(pct=10).publish(label='C')
        D = (A).percentile(pct=50).publish(label='D')
        E = (A).percentile(pct=90).publish(label='E')
        F = (A).max().publish(label='F')
    EOF
    show_data_markers = false
    show_event_lines  = false
    stacked           = false
    time_range        = 7200
    timezone          = "UTC"
    unit_prefix       = "Binary"

    axis_left {
        label          = "bytes/interval"
        min_value      = 0
    }

    viz_options {
        axis         = "left"
        display_name = "NetworkOut - Scale:60"
        label        = "A"
    }
    viz_options {
        axis         = "left"
        color        = "aquamarine"
        display_name = "p10"
        label        = "C"
    }
    viz_options {
        axis         = "left"
        color        = "azure"
        display_name = "median"
        label        = "D"
    }
    viz_options {
        axis         = "left"
        color        = "green"
        display_name = "min"
        label        = "B"
    }
    viz_options {
        axis         = "left"
        color        = "magenta"
        display_name = "max"
        label        = "F"
    }
    viz_options {
        axis         = "left"
        color        = "pink"
        display_name = "p90"
        label        = "E"
    }
}
# signalfx_list_chart.sfx_aws_ec2_dash_1_13:
resource "signalfx_list_chart" "sfx_aws_ec2_dash_1_13" {
    color_by                = "Dimension"
    max_precision           = 4
    name                    = "Top Network Bytes Out/Min"
    program_text            = "A = data('NetworkOut', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', '*') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').scale(60).mean(by=['InstanceId']).top(count=5).publish(label='A')"
    secondary_visualization = "Sparkline"
    sort_by                 = "-value"
    unit_prefix             = "Binary"
}
# signalfx_time_chart.sfx_aws_ec2_dash_1_14:
resource "signalfx_time_chart" "sfx_aws_ec2_dash_1_14" {
    axes_include_zero = false
    axes_precision    = 0
    color_by          = "Dimension"
    disable_sampling  = false
    name              = "Network Bytes Out vs. 24h Change %"
    plot_type         = "ColumnChart"
    program_text      = <<-EOF
        A = data('NetworkOut', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', '*') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').scale(60).sum().mean(over='1h').publish(label='A')
        B = (A).timeshift('1d').publish(label='B', enable=False)
        C = (A/B - 1).scale(100).publish(label='C')
    EOF
    show_data_markers = false
    show_event_lines  = false
    stacked           = false
    time_range        = 7200
    timezone          = "UTC"
    unit_prefix       = "Binary"

    axis_left {
        label          = "bytes/min - BLUE"
    }

    axis_right {
        label          = "% change - RED"
    }

    viz_options {
        axis         = "left"
        display_name = "A - Timeshift 1d"
        label        = "B"
    }
    viz_options {
        axis         = "left"
        display_name = "NetworkIn"
        label        = "A"
    }
    viz_options {
        axis         = "right"
        color        = "brown"
        display_name = "24h growth %"
        label        = "C"
        plot_type    = "LineChart"
    }
}
# signalfx_dashboard.sfx_aws_ec2_dash_1:
resource "signalfx_dashboard" "sfx_aws_ec2_dash_1" {
    charts_resolution           = "default"
    dashboard_group             = signalfx_dashboard_group.sfx_aws_ec2.id
    discovery_options_query     = "namespace:\"AWS/EC2\" AND _exists_:InstanceId"
    discovery_options_selectors = [
        "namespace:AWS/EC2",
        "sf_key:InstanceId",
        "sf_key:host",
    ]
    name                        = "EC2 Instances"

    chart {
        chart_id = signalfx_list_chart.sfx_aws_ec2_dash_1_4.id
        column   = 4
        height   = 1
        row      = 1
        width    = 4
    }
    chart {
        chart_id = signalfx_time_chart.sfx_aws_ec2_dash_1_14.id
        column   = 8
        height   = 1
        row      = 4
        width    = 4
    }
    chart {
        chart_id = signalfx_list_chart.sfx_aws_ec2_dash_1_10.id
        column   = 4
        height   = 1
        row      = 3
        width    = 4
    }
    chart {
        chart_id = signalfx_time_chart.sfx_aws_ec2_dash_1_11.id
        column   = 8
        height   = 1
        row      = 3
        width    = 4
    }
    chart {
        chart_id = signalfx_time_chart.sfx_aws_ec2_dash_1_7.id
        column   = 4
        height   = 1
        row      = 2
        width    = 4
    }
    chart {
        chart_id = signalfx_single_value_chart.sfx_aws_ec2_dash_1_0.id
        column   = 0
        height   = 1
        row      = 0
        width    = 4
    }
    chart {
        chart_id = signalfx_list_chart.sfx_aws_ec2_dash_1_13.id
        column   = 4
        height   = 1
        row      = 4
        width    = 4
    }
    chart {
        chart_id = signalfx_time_chart.sfx_aws_ec2_dash_1_9.id
        column   = 0
        height   = 1
        row      = 3
        width    = 4
    }
    chart {
        chart_id = signalfx_list_chart.sfx_aws_ec2_dash_1_5.id
        column   = 8
        height   = 1
        row      = 1
        width    = 4
    }
    chart {
        chart_id = signalfx_time_chart.sfx_aws_ec2_dash_1_3.id
        column   = 0
        height   = 1
        row      = 1
        width    = 4
    }
    chart {
        chart_id = signalfx_list_chart.sfx_aws_ec2_dash_1_1.id
        column   = 4
        height   = 1
        row      = 0
        width    = 4
    }
    chart {
        chart_id = signalfx_time_chart.sfx_aws_ec2_dash_1_6.id
        column   = 0
        height   = 1
        row      = 2
        width    = 4
    }
    chart {
        chart_id = signalfx_list_chart.sfx_aws_ec2_dash_1_2.id
        column   = 8
        height   = 1
        row      = 0
        width    = 4
    }
    chart {
        chart_id = signalfx_list_chart.sfx_aws_ec2_dash_1_8.id
        column   = 8
        height   = 1
        row      = 2
        width    = 4
    }
    chart {
        chart_id = signalfx_time_chart.sfx_aws_ec2_dash_1_12.id
        column   = 0
        height   = 1
        row      = 4
        width    = 4
    }
}
